class CreateBusinessUsers < ActiveRecord::Migration
  def change
    create_table :business_users do |t|
      t.string :business_user_name
      t.string :business_user_email
      t.string :business_user_password
      t.integer :business_user_cap
      t.string :business_user_street
      t.string :business_user_city
      t.string :business_user_state
      t.string :business_user_zipcode
      t.string :business_logo_url
      
      t.timestamps null: false
    end
  end
end
