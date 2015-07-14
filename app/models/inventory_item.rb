class InventoryItem < ActiveRecord::Base
  belongs_to :business_user
  belongs_to :repair_order
  belongs_to :repair_item


end
