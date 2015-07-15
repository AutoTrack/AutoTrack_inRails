class Vehicle < ActiveRecord::Base
  belongs_to :client
  has_many :repair_orders
  has_many :invoices


end
