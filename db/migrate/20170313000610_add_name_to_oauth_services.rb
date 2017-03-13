class AddNameToOauthServices < ActiveRecord::Migration[5.0]
  def change
    add_column :oauth_services, :name, :string, null: false
  end
end
