class AddRepairOrderIdToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :repair_order_id, :integer
  end
end
