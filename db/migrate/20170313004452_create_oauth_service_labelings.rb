class CreateOauthServiceLabelings < ActiveRecord::Migration[5.0]
  def change
    create_table :oauth_service_labelings do |t|
      t.references :oauth_service, null: false, foreign_key: true
      t.references :oauth_service_label, null: false, foreign_key: true

      t.timestamps
    end
  end
end
