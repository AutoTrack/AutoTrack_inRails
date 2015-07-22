class InventoryItem < ActiveRecord::Base
# This model should be complete
  belongs_to :business_user
  has_many :repair_orders
  has_many :repair_items, through: :repair_orders

  validates_presence_of :inventory_count, :part_number, :part_name, :business_part_number,
    :category, :inventory_item_location, :inventory_item_supplier, :reorder_alert,
    :order_to_quantity, :inventory_item_cost, :inventory_item_markup, :inventory_count

    validates_inclusion_of :inventory_item_billable, :in => [true, false]
    validates_inclusion_of :inventory_item_taxable, :in => [true, false]
    validates_inclusion_of :tool, :in => [true, false]

end
