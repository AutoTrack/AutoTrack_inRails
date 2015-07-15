class AddBusinessUserIdToEmployeeUsersRepairOrders < ActiveRecord::Migration
  def change
    add_column :employee_users_repair_orders, :business_user_id, :integer
  end
end
