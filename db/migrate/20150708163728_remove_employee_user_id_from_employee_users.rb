class RemoveEmployeeUserIdFromEmployeeUsers < ActiveRecord::Migration
  def change
    remove_column :employee_users, :employee_user_id, :string
  end
end
