class AddAdminToBusinessUsers < ActiveRecord::Migration
  def change
    add_column :business_users, :admin, :boolean
  end
end
