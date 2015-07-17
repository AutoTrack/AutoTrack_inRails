class Vehicle < ActiveRecord::Base
  belongs_to :business_user
  belongs_to :client
  belongs_to :repair_order
  has_many :invoices
  #---------------------------------------------------------------------




end
