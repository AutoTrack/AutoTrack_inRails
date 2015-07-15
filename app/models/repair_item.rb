class RepairItem < ActiveRecord::Base
  belongs_to :repair_order
  belongs_to :inventory_item
end
