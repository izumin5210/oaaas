require 'rails_helper'

RSpec.describe FindOrCreateUserCommand, type: :command do
  include AuthHashMock::GitHub

  let(:cmd) { FindOrCreateUserCommand.run(auth_hash: auth_hash) }
  subject { cmd }

  context 'when the authenticated account has not been registered' do
    it 'creates a new user and a new oauth account' do
      is_expected.to be_success
      expect(cmd.user).to be_persisted
      expect(cmd.account).to be_persisted
      expect(cmd.user.oauth_accounts.size).to eq 1
      expect(User.count).to eq 1
      expect(OauthAccount.count).to eq 1
      expect(LoginName.count).to eq 1
    end
  end

  context 'when the authenticated account has been registered' do
    let(:prev_name) { "prev_#{info['name']}" }
    let(:prev_nickname) { "prev_#{nickname}" }
    let(:prev_login_name) { prev_nickname }

    before do
      user = User.create(login_name: LoginName.new(id: prev_login_name), name: prev_name)
      account = OauthAccount.new(
        uid: uid,
        provider: provider,
        name: prev_name,
        nickname: prev_nickname,
        credentials: credentials.to_json,
        raw_info: raw_info.to_json,
      )
      user.oauth_accounts << account
    end

    it 'returns the user and update the accounts' do
      expect(User.count).to eq 1
      expect(OauthAccount.count).to eq 1
      expect(LoginName.count).to eq 1
      is_expected.to be_success
      expect(cmd.user).to be_persisted
      expect(cmd.account).to be_persisted
      expect(cmd.user.oauth_accounts.size).to eq 1
      expect(User.count).to eq 1
      expect(OauthAccount.count).to eq 1
      expect(LoginName.count).to eq 1
      expect(cmd.user.name).to eq prev_name
      expect(cmd.user.login_name.id).to eq prev_login_name
      expect(cmd.account.name).to eq info['name']
      expect(cmd.account.nickname).to eq nickname
    end
  end

  context 'when the login_name conflicts' do
    before do
      User.create(
        login_name: LoginName.new(id: nickname),
        name: "existed #{nickname}",
      )
    end

    it 'does not create any records' do
      is_expected.to_not be_success
      expect(cmd.errors.size).to eq 1
      expect(cmd.errors[:login_name].size).to eq 1
      expect(User.count).to eq 1
      expect(OauthAccount.count).to eq 0
      expect(LoginName.count).to eq 1
      expect(User.first.oauth_accounts.size).to eq 0
    end
  end
end
