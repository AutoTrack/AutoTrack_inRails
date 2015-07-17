class EmployeeUsersRepairOrder < ActiveRecord::Base
  belongs_to :business

  belongs_to :repair_order
  belongs_to :employee_user

end
