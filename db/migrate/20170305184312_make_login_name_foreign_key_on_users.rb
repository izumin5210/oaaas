class MakeLoginNameForeignKeyOnUsers < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :users, :login_names, column: :login_name
  end
end
