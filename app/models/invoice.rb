class Invoice < ActiveRecord::Base
  belongs_to :business_user
  belongs_to :repair_order
  belongs_to :client
  belongs_to :vehicle
end
