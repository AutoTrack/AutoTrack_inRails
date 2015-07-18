class AddAccessToken3ToClients < ActiveRecord::Migration
  def change
    add_column :clients, :access_token3, :string
  end
end
