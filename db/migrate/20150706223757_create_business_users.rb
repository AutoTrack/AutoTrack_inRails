class CreateBusinessUsers < ActiveRecord::Migration
  def change
    create_table :business_users do |t|
      t.string :business_user_name
      t.string :business_user_email
      t.string :business_user_password
      t.integer :business_user_cap

      t.timestamps null: false
    end
  end
end
