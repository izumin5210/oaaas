class CreateOwnerships < ActiveRecord::Migration[5.0]
  def change
    create_table :ownerships do |t|
      t.references :ownable, polymorphic: true, null: false
      t.references :application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
