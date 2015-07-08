class AddEmployeeNumberToEmployeeUsers < ActiveRecord::Migration
  def change
    add_column :employee_users, :employee_number, :string
  end
end
