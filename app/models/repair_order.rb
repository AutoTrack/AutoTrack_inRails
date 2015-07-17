class RepairOrder < ActiveRecord::Base
  belongs_to :business_user


  has_many :employee_users_repair_orders
  has_many :employee_users, through: :employee_users_repair_orders

  belongs_to :client

  has_one :invoice
  has_one :vehicle


  has_many :repair_items, dependent: :destroy
  has_many :inventory_items, through: :repair_items


end
