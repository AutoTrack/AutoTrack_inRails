class RepairOrder < ActiveRecord::Base
  belongs_to :business_user
  has_one :invoice
  has_many :repair_items, dependent: :destroy
  has_and_belongs_to_many :employee_users
  belongs_to :client
  has_many :inventory_items, through: :repair_items


  validates :access_token, presence: true
  validates :access_token2, presence: true
end
