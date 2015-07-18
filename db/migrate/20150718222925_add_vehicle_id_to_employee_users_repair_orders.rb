class AddVehicleIdToEmployeeUsersRepairOrders < ActiveRecord::Migration
  def change
    add_column :employee_users_repair_orders, :vehicle_id, :integer
  end
end
