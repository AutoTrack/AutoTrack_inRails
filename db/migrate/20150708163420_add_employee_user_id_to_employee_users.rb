class AddEmployeeUserIdToEmployeeUsers < ActiveRecord::Migration
  def change
    add_column :employee_users, :employee_user_id, :string
  end
end
