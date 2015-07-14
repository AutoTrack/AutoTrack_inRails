class RepairItem < ActiveRecord::Base
  belongs_to :repair_order
  has_many :inventory_items

  validates :access_token, presence: true
  validates :access_token2, presence: true
end
