class EmployeeUser < ActiveRecord::Base
  belongs_to :business_user
  has_and_belongs_to_many :repair_orders
  has_many :clients, through: :repair_orders


  validates :access_token2, presence: true
  validates :employee_email, uniqueness: true, presence: true


  before_validation :ensure_access_token2



  def ensure_access_token2
    if self.access_token2.blank?
      self.access_token2 = EmployeeUser.generate_token2
    end
  end

  def self.generate_token2
    token2 = SecureRandom.hex
    while EmployeeUser.exists?(access_token2: token2)
      token2 = SecureRandom.hex
    end
    token2
  end
end
