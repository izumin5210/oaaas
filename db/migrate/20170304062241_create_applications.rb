class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :name, limit: 39, null: false
      t.text :description

      t.timestamps
    end
    add_index :applications, :name, unique: true
  end
end
