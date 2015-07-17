class AddPartNameToInventoryItems < ActiveRecord::Migration
  def change
    add_column :inventory_items, :part_name, :string
  end
end
