class AddEmployeeUsersRepairOrderIdToRepairOrders < ActiveRecord::Migration
  def change
    add_column :repair_orders, :employee_users_repair_order_id, :integer
  end
end
