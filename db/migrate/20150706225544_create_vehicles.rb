class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.integer :client_id
      t.string :vehicle_type
      t.string :vehicle_year
      t.string :vehicle_model
      t.string :vehicle_vin_number
      t.string :vehicle_color
      t.string :vehicle_liscense_plate
      t.text :vehicle_comment

      t.timestamps null: false
    end
  end
end
