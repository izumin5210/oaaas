class FindOrCreateUserCommand
  include ApplicationCommand

  attr_reader :auth_hash, :credentials, :info,
    :account, :user

  validates :auth_hash, presence: true
  validates :credentials, presence: true
  validates :info, presence: true

  def initialize(auth_hash:)
    @auth_hash = auth_hash
    @credentials = auth_hash['credentials']
    @info = auth_hash['info']
  end

  def run
    @account = find_or_initialize_oauth_account
    @user = find_or_create_user_by!(account: @account)
  end

  private

  def find_or_initialize_oauth_account
    account = OauthAccount.find_or_initialize_by(
      uid: auth_hash['uid'],
      provider: auth_hash['provider']
    )

    unless account.persisted?
      account.name = info['name']
      account.nickname = info['nickname']
      account.email = info['email']
      case account.provider
      when 'github'
        account.url = info['urls']['GitHub']
      end
      account.image_url = info['image']
      account.access_token = credentials['token']
      account.access_secret = credentials['secret']
      account.credentials = credentials.to_json
      account.raw_info = auth_hash['extra']['raw_info'].to_json
    end

    account
  end

  def find_or_create_user_by!(account:)
    (account.user || User.new).tap do |user|
      user.name = account.name
      user.login_name = account.nickname
      user.save!
      user.oauth_accounts << accounts
    end
  end
end
