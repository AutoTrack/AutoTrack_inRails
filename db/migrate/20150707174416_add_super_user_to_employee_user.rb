class AddSuperUserToEmployeeUser < ActiveRecord::Migration
  def change
    add_column :employee_users, :super_user, :boolean, :default => false
  end
end
