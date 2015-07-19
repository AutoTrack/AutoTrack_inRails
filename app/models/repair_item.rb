class RepairItem < ActiveRecord::Base
  # This model should be complete
  belongs_to :repair_order
  belongs_to :inventory_item

  # def substract_inventory(items_taken)
  #   self.inventory_count = inventory_count - items_taken
  #   save
  # end
end
