class EmployeeUsersRepairOrder < ActiveRecord::Base
  belongs_to :repair_order
  belongs_to :business
  has_many :employee_users

end
