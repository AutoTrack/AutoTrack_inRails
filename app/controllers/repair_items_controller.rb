class RepairItemsController < ApplicationController
  before_action :authenticate_business_user_with_token!
  before_action :authenticate_employee_user_with_token!


  def add_repair_item_quantity
    @repair_order = current_business_user.repair_orders.find(params[:id])
    @add_repair_item_quantity = @repair_order.repair_items.update(
                                                repair_item_quantity: params[:repair_item_quantity])
    unless @add_repair_item_quantity.nil? || @add_repair_item_quantity == 0
      @add_repair_item_quantity.save
      render json: { repair_items: @add_repair_item_quantity.as_json },
        status: :ok
    else
      flash[:error] = 'Please select a quantity'
    end
  end


  def show_repair_item
    @repair_order = current_business_user.repair_orders.find(params[:id])
    @show_repair_item = @repair_order.repair_items.find(params[:id])
      render json: { repair_item: @show_repair_item.as_json },
        status: :ok
  end

  def checkout_repair_items
    @repair_order = current_business_user.repair_orders.find(params[:id])
    @repair_order.repair_items.each do |ri|
      new_quantity = ri.inventory_item.inventory_count - ri.repair_item_quantity
      ri.inventory_item.update(inventory_count: new_quantity)
    end

    render json: { inventory: @repair_order.inventory_items.as_json },
      status: :ok
  end

  def add_repair_item
    @repair_order = current_business_user.repair_orders.find(params[:id])
    @repair_order.repair_items.new(params[:repair_item_id])
    @repair_order.save
      render json: { repair_items: @repair_order.as_json },
        status: :ok
  end

  def update_repair_item_quantity
    @repair_order = current_business_user.repair_orders.find(params[:id])
    @repair_order.repair_items.find(params[:id])
    @repair_order_item = (repair_item_quantity: params[:repair_item_quantity])
      render json: { repair_items: @repair_order.as_json },
        status: :ok
  end

  def remove_repair_item
    @repair_order = current_business_user.repair_orders.find(params[:id])
    @repair_order.repair_items.destroy
    @repair_order.save
      render json: { repair_items: @repair_order.as_json },
        status: :ok
  end
end
