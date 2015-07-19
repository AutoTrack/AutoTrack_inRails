class AddAccessToken5ToRepairOrders < ActiveRecord::Migration
  def change
    add_column :repair_orders, :access_token5, :string
  end
end
