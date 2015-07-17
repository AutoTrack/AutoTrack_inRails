class AddEmployeeUsersRepairOrderToEmployeeUsers < ActiveRecord::Migration
  def change
    add_column :employee_users, :employee_users_repair_order_id, :integer
  end
end
