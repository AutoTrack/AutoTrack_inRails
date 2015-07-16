class AddBusinessUserIdToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :business_user_id, :integer
  end
end
