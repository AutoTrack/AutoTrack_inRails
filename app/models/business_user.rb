class BusinessUser < ActiveRecord::Base

  has_many :employee_users
  has_many :repair_orders

  has_many :inventory_items
  has_many :repair_items

  has_many :clients
  has_many :vehicles
  # has_many :vehicles, through: :clients
  has_many :invoices

  has_many :employee_users_repair_orders

  # after_create :send_notification

  #   def send_notification
  #       BusinessUserMailer.new_business_user(self).deliver
  #   end

#---Validations----
  validates :business_user_password, :access_token, presence: true
  validates :business_username, uniqueness: true, presence: true

#----Callbacks----
  before_validation :ensure_access_token

# This method associates the attribute ":avatar" with a file attachment
  has_attached_file :logo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  },
  #if default url is needed.
  default_url: "/images/:style/missing.png"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

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
