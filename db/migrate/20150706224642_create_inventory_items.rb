class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.integer :business_user_id
      t.string :part_number
      t.string :business_part_number
      t.string :category
      t.string :inventory_item_location
      t.string :inventory_item_supplier
      t.integer :reorder_alert
      t.integer :order_to_quantity
      t.boolean :inventory_item_billable
      t.boolean :inventory_item_taxable
      t.float :inventory_item_cost
      t.float :inventory_item_markup
      t.integer :inventory_count
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :tool

      t.timestamps null: false
    end
  end
end
