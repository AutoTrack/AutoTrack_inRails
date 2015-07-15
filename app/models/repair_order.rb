class RepairOrder < ActiveRecord::Base
  belongs_to :client
  belongs_to :business_user
  has_one :invoice

  has_and_belongs_to_many :employee_users

  has_many :repair_items, dependent: :destroy
  has_many :inventory_items, through: :repair_items

  has_many :employee_users_repair_orders
  has_many :employee_users, through: :employee_users_repair_orders
end
