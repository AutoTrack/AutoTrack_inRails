class AddInvoiceIdToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :invoice_id, :integer
  end
end
