class FindOrCreateUserCommand
  include ApplicationCommand

  attr_reader :auth_hash, :credentials, :info,
    :account, :user, :login_name

  validates :auth_hash, presence: true
  validates :credentials, presence: true
  validates :info, presence: true

  def initialize(auth_hash:)
    @auth_hash = auth_hash
    @credentials = auth_hash['credentials']
    @info = auth_hash['info']
  end

  def run
    ActiveRecord::Base.transaction do
      @account = find_or_initialize_oauth_account!
      @user = find_or_create_user_by!(account: @account)
    end
  rescue => e
    if e.record.is_a? LoginName
      @login_name = e.record
      @login_name.errors.each do |attr, error|
        errors.add(:login_name, :invalid, message: "login_name.#{attr}: #{error}")
      end
    end
  end

  private

  def find_or_initialize_oauth_account!
    account = OauthAccount.find_or_initialize_by(
      uid: auth_hash['uid'],
      provider: auth_hash['provider']
    )

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
    account.save! if account.persisted?

    account
  end

  def find_or_create_user_by!(account:)
    if account.user.present?
      account.user
    else
      User.create!(
        login_name: LoginName.create!(id: account.nickname).id,
        name: account.name,
        oauth_accounts: [account],
      )
    end
  end
end
