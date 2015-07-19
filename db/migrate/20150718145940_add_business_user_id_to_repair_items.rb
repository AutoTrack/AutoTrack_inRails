class AddBusinessUserIdToRepairItems < ActiveRecord::Migration
  def change
    add_column :repair_items, :business_user_id, :integer
  end
end
