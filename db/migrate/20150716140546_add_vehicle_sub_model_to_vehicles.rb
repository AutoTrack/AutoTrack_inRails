class AddVehicleSubModelToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :vehicle_sub_model, :string
  end
end
