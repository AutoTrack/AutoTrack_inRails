class AddRoleToEmployeeUsers < ActiveRecord::Migration
  def change
    add_column :employee_users, :role, :string
  end
end
