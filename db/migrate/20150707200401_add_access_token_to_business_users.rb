class AddAccessTokenToBusinessUsers < ActiveRecord::Migration
  def change
    add_column :business_users, :access_token, :string
  end
end
