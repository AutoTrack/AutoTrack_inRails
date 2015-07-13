class RepairOrder < ActiveRecord::Base
  belongs_to :business_user
  has_one :invoice
  has_many :repair_items
  has_and_belongs_to_many :employee_users
  belongs_to :client


end
