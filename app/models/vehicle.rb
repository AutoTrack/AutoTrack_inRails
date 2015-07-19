class Vehicle < ActiveRecord::Base
  belongs_to :business_user
  belongs_to :client
  has_many :repair_orders
  has_many :employee_users_repair_orders
  has_many :invoices
  #---------------------------------------------------------------------


  validates :access_token4, presence: true


  before_validation :ensure_access_token4

  def ensure_access_token4
    if self.access_token4.blank?
      self.access_token4 = Vehicle.generate_token4
    end
  end

  def self.generate_token4
    token4 = SecureRandom.hex
    while Vehicle.exists?(access_token4: token4)
      token4 = SecureRandom.hex
    end
    token4
  end

end
