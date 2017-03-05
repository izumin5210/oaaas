class RenameCredentialCredentialsOnOauthAccounts < ActiveRecord::Migration[5.0]
  def change
    rename_column :oauth_accounts, :credential, :credentials
  end
end
