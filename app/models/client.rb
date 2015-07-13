class Client < ActiveRecord::Base
  has_many :invoices
  has_many :repair_orders
  has_many :vehicles
  has_many :employees, through: :repair_orders
  belongs_to :business_user
end
