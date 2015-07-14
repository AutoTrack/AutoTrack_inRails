class AddVehicleIdToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :vehicle_id, :integer
  end
end
