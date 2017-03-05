class RemoveOwnerships < ActiveRecord::Migration[5.0]
  def change
    # > ActiveRecord::IrreversibleMigration:
    # 
    # > To avoid mistakes, drop_table is only reversible if given options or a block (can be empty).
    drop_table :ownerships
    add_reference :applications, :owner,
      polymorphic: true, index: true, null: false
  end
end
