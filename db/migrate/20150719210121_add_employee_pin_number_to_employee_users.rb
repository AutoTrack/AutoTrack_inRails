class AddEmployeePinNumberToEmployeeUsers < ActiveRecord::Migration
  def change
    add_column :employee_users, :employee_pin_number, :integer
  end
end
