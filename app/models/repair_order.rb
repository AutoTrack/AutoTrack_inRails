class RepairOrder < ActiveRecord::Base
  has_one :invoice
  has_many :repair_items
  has_and_belongs_to_many :employee_users
  belongs_to :client
  
end
