class RepairItemsController < ApplicationController

  def add_repair_item
    @repair_order = current_business_user.repair_orders.find(params[:id])
    @add_repair_item = @repair_order.repair_items.new(params[:repair_item])
    @add_repair_item.save
      render json: { repair_items: @repair_order.as_json },
        status: :ok
  end

  def remove_repair_item
    @repair_order = current_business_user.repair_orders.find(params[:id])
    @remove_repair_item = @repair_order.repair_items.destroy(params[:id])
    @remove_repair_item.save
      render json: { repair_items: @repair_order.as_json },
        status: :ok
  end

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

  def update_repair_item_quantity

  end


  def show_repair_item
    @repair_order = current_business_user.repair_orders.find(params[:id])
    @show_repair_item = @repair_order.repair_items.find(params[:id])
      render json: { repair_item: @show_repair_item.as_json },
        status: :ok
  end

  # def checkout_repair_items
  #   @repair_order = current_business_user.repair_orders.find(params[:id])
  #   @repair_order_items = @repair_order.repair_items.find(paramas[:id])
  #   @repair_item_quantity = @repair_order.repair_items.find_by(params[:repair_item_quantity])
  #   @checkout_items = @repair_order_items.inventory_items.find_by(params[:inventory_id])
  #   @inventory_item_quantity = current_business_user.inventory_items.find_by(
  #                                                                   params[:inventory_item_quantity])
  #     if @checkout_items
  #       @inventory_count_update = @inventory_item_quantity - @repair_item_quantity


end
