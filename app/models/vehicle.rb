class Vehicle < ActiveRecord::Base
  belongs_to :client
  has_many :repair_orders


end
