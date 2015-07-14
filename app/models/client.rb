class Client < ActiveRecord::Base
  has_many :invoices
  has_many :repair_orders
  has_many :vehicles
  has_many :employees, through: :repair_orders
  belongs_to :business_user

  validates :access_token, presence: true
  validates :access_token2, presence: true
end
