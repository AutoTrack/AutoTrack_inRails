class Vehicle < ActiveRecord::Base
  belongs_to :client
  belongs_to :business_user
  has_and_belongs_to_many :repair_orders
  has_many :invoices


end
