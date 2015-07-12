class CreateEmployeeUsersRepairOrders < ActiveRecord::Migration
  def change
    create_table :employee_users_repair_orders do |t|
      t.integer :employee_user_id
      t.integer :repair_order_id
    end
  end
end
