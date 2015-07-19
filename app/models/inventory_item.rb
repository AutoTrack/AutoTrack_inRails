class InventoryItem < ActiveRecord::Base
# This model should be complete
  belongs_to :business_user
  has_many :repair_orders
  has_many :repair_items, through: :repair_orders

end
