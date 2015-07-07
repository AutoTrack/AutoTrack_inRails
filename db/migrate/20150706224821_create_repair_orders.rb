class CreateRepairOrders < ActiveRecord::Migration
  def change
    create_table :repair_orders do |t|
      t.integer :business_user_id
      t.integer :employee_user_id
      t.integer :client_id
      t.string :repair_order_number
      t.integer :vehicle_id
      t.integer :repair_type_id

      t.timestamps null: false
    end
  end
end
