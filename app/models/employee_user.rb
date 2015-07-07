class EmployeeUser < ActiveRecord::Base
  belongs_to :business_user
  has_many :repair_orders
end
