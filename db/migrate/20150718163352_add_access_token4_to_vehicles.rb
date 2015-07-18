class AddAccessToken4ToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :access_token4, :string
  end
end
