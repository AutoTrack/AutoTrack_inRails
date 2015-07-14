class InventoryItem < ActiveRecord::Base
  belongs_to :business_user
  belongs_to :repair_order
  belongs_to :repair_item

  validates :access_token, presence: true
  validates :access_token2, presence: true
end
