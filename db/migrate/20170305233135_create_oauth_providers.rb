class CreateOauthProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :oauth_providers, id: :string do |t|
    end
  end
end
