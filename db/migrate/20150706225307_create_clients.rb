class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_first_name
      t.string :client_last_name
      t.string :client_street_address
      t.string :client_city
      t.string :client_state
      t.string :client_zipcode
      t.string :client_primary_phone
      t.string :client_secondary_phone
      t.string :client_email

      t.timestamps null: false
    end
  end
end
