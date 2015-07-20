class AddCheckedOutToRepairItems < ActiveRecord::Migration
  def change
    add_column :repair_items, :checked_out, :boolean, default: false
  end
end
