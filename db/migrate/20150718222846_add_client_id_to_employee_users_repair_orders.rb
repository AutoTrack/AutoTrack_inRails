class AddClientIdToEmployeeUsersRepairOrders < ActiveRecord::Migration
  def change
    add_column :employee_users_repair_orders, :client_id, :integer
  end
end
