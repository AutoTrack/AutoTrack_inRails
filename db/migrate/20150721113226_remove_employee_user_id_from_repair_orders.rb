class RemoveEmployeeUserIdFromRepairOrders < ActiveRecord::Migration
  def change
    remove_column :repair_orders, :employee_user_id, :integer
  end
end
