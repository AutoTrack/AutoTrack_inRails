class Client < ActiveRecord::Base
  has_many :invoices
  has_many :repair_orders
  has_many :vehicles
end
