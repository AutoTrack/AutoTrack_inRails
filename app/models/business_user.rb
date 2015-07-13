class BusinessUser < ActiveRecord::Base
  has_many :employee_users
  has_many :repair_orders

  has_many :invoices
  has_many :clients


  validates :business_user_password, :access_token, presence: true
  validates :business_username, uniqueness: true, presence: true


  before_validation :ensure_access_token

  def ensure_access_token
    if self.access_token.blank?
      self.access_token = BusinessUser.generate_token
    end
  end

  def self.generate_token
    token = SecureRandom.hex
    while BusinessUser.exists?(access_token: token)
      token = SecureRandom.hex
    end
    token
  end
end
