class Client < ActiveRecord::Base
  belongs_to :business_user
  has_many :repair_orders
  has_many :employee_users_repair_orders
  has_many :vehicles
  has_many :invoices
  #----------------------------------------------------------------

  validates :access_token3, presence: true


  before_validation :ensure_access_token3

  def ensure_access_token3
    if self.access_token3.blank?
      self.access_token3 = Client.generate_token3
    end
  end

  def self.generate_token3
    token3 = SecureRandom.hex
    while Client.exists?(access_token3: token3)
      token3 = SecureRandom.hex
    end
    token3
  end

end
