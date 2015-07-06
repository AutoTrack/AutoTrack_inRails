class CreateRepairItems < ActiveRecord::Migration
  def change
    create_table :repair_items do |t|
      t.integer :inventory_item_id
      t.integer :repair_order_id
      t.integer :repair_item_quantity

      t.timestamps null: false
    end
  end
end
