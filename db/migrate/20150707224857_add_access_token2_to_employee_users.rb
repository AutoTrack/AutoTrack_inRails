class AddAccessToken2ToEmployeeUsers < ActiveRecord::Migration
  def change
    add_column :employee_users, :access_token2, :string
  end
end
