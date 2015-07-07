class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :business_user_id
      t.integer :repair_order_id
      t.integer :client_id
      t.string :invoice_url
      t.text :invoice_status

      t.timestamps null: false
    end
  end
end
