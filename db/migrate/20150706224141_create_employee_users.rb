class CreateEmployeeUsers < ActiveRecord::Migration
  def change
    create_table :employee_users do |t|
      t.integer :business_user_id
      t.string :employee_first_name
      t.string :employee_last_name
      t.string :employee_email
      t.string :employee_password
      t.string :employee_pin
      t.string :employee_access_rights
      t.boolean :super_user, default: false
      t.timestamps null: false
    end
  end
end
