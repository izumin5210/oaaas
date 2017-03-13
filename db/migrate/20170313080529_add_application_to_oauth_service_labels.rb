class AddApplicationToOauthServiceLabels < ActiveRecord::Migration[5.0]
  def change
    add_reference :oauth_service_labels, :application, null: false, foreign_key: true
  end
end
