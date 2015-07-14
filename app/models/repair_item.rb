class RepairItem < ActiveRecord::Base
  belongs_to :repair_order
  has_many :inventory_items


end
