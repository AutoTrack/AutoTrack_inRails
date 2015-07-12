class AddBusinessUsernameToBusinessUsers < ActiveRecord::Migration
  def change
    add_column :business_users, :business_username, :string
  end
end
