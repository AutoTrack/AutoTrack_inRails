class Client < ActiveRecord::Base
  belongs_to :business_user
  has_many :repair_orders
  has_many :vehicles
  has_many :invoices
  #----------------------------------------------------------------


end
