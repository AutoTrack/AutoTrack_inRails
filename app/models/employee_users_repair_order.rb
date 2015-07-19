class EmployeeUsersRepairOrder < ActiveRecord::Base
 #This model should be complete
  belongs_to :business
  belongs_to :vehicle
  belongs_to :client
  belongs_to :repair_order
  belongs_to :employee_user

end
