class RepairOrder < ActiveRecord::Base

  belongs_to :business_user
  belongs_to :employee_user
  has_many :employee_users_repair_orders
  # has_many :employee_users, through: :employee_users_repair_orders

  has_many :repair_items, dependent: :destroy
  has_many :inventory_items, through: :repair_items

  belongs_to :client
  belongs_to :vehicle
  has_one :invoice
  #----------------------------------------------------------------

  validates :access_token5, presence: true


  before_validation :ensure_access_token5

  def ensure_access_token5
    if self.access_token5.blank?
      self.access_token5 = RepairOrder.generate_token5
    end
  end

  def self.generate_token5
    token5 = SecureRandom.hex
    while RepairOrder.exists?(access_token5: token5)
      token5 = SecureRandom.hex
    end
    token5
  end





end
