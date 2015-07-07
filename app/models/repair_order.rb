class RepairOrder < ActiveRecord::Base
  has_one :invoice
  has_many :repair_items
  belongs_to :employee_user
end
