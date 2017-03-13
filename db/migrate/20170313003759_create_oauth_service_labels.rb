class CreateOauthServiceLabels < ActiveRecord::Migration[5.0]
  def change
    create_table :oauth_service_labels do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :oauth_service_labels, :name
  end
end
