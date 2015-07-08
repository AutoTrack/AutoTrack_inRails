class BusinessUser < ActiveRecord::Base
  has_many :employee_users
  has_many :repair_orders
  has_many :invoices
  has_many :clients
end