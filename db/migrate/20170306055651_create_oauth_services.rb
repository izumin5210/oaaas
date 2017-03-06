class CreateOauthServices < ActiveRecord::Migration[5.0]
  def change
    create_table :oauth_services do |t|
      t.string :consumer_key, null: false
      t.string :consumer_secret, null: false
      t.string :scope
      t.string :provider, null: false
      t.references :application, foreign_key: true, null: false

      t.timestamps
    end

    add_foreign_key :oauth_services, :oauth_providers,
      column: :provider, primary_key: :id
  end
end
