class Vehicle < ActiveRecord::Base
  belongs_to :client
  has_many :repair_orders


  validates :access_token, presence: true
  validates :access_token2, presence: true
end
