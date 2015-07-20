class RemoveBusinessUserIdFromEmployeeUsersRepairOrders < ActiveRecord::Migration
  def change
    remove_column :employee_users_repair_orders, :business_user_id, :integer
  end
end
