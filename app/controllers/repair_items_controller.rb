class RepairItemsController < ApplicationController

  def add_repair_item
    @repair_order = current_business_user.repair_orders.find(params[:id])
    @add_repair_item = @repair_order.repair_items.new(params[:repair_item_id])

  end

  def remove_repair_item
    @repair_order = current_business_user.repair_orders.find(params[:id])
    @remove_repair_item = @repair_order.repair_items.destroy(params[:repair_item_id])
  end

  def add_repair_item_quantity

  end

  def update_repair_item_quantity

  end

  def show_repair_items

  end

  def show_repair_item

  end






end

# create_table "repair_items", force: :cascade do |t|
#   t.integer  "inventory_item_id"
#   t.integer  "repair_order_id"
#   t.integer  "repair_item_quantity"
#   t.datetime "created_at",           null: false
#   t.datetime "updated_at",           null: false
# end
