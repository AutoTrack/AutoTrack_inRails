class RepairItemsController < ApplicationController
  before_action :authenticate_business_user_with_token!
  before_action :authenticate_employee_user_with_token!

  def add_repair_item
    @business = current_business_user.id
    @add_repair_item = current_repair_order.repair_items.new(
                                        inventory_item_id: params[:inventory_item_id],
                                        business_user_id: @business )
    if @add_repair_item.save
      render json: { repair_item: @add_repair_item.as_json(include: [:repair_order,
                                                                    :inventory_item]) },
        status: :ok
    else
        render json: { errors: @add_repair_item.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def remove_repair_item
    @repair_order_number = current_repair_order.repair_order_number
    @repair_item = current_repair_order.repair_items.find(params[:id])
    @repair_item.destroy
      render json: { message: "Repair Item #{@repair_item.id} has been removed from Repair Order #{@repair_order_number}" },
      status: :gone
  end

  def add_repair_item_quantity
    @repair_item = current_repair_order.repair_items.find(params[:id])
    @add_item_quantity = @repair_item.update(repair_item_quantity: params[:repair_item_quantity])

    unless @add_item_quantity.nil? || @add_item_quantity == 0
      render json: { repair_items: @add_item_quantity.as_json(include: [:repair_order,
                                                                       :inventory_item]) },
        status: :ok
    else
      flash[:error] = 'Please select a quantity'
    end
  end

  def update_repair_item_quantity
    @repair_item = current_repair_order.repair_items.find(params[:id])
    @update_quantity = @repair_item.update(repair_item_quantity: params[
                                                              :repair_item_quantity])
      render json: { repair_item: @repair_item.as_json(include: [:repair_order,
                                                                :inventory_item]) },
      status: :ok
  end

  def show_repair_item
    @repair_item = current_repair_order.repair_items.find(params[:id])
      render json: { repair_item: @repair_item.as_json(include: [:repair_order,
                                                                :inventory_item]) },
      status: :ok
  end

  def show_repair_items
    @repair_order_number = current_repair_order.repair_order_number
    @repair_items = current_repair_order.repair_items.all
    @repair_items.each do |ri|
    if ri.checked_out==false
      render json: { repair_items: @repair_items.as_json(include: [:repair_order,
                                                                  :inventory_item]) },
        status: :ok
    else
      render json: { message: "There are currently no repair items attached to Repair Order #{@repair_order_number}" },
        status: :ok
    end
  end

  def checkout_repair_items
    @repair_order_number = current_repair_order.repair_order_number
    @repair_order = current_repair_order.repair_items.each do |ri|
      if ri.checked_out == false
        new_quantity = ri.inventory_item.inventory_count - ri.repair_item_quantity

        ri.inventory_item.update(inventory_count: new_quantity)
        ri.repair_item.update(checked_out: true)

        render json: { message: "Repair items have been successfully checked out for Repair Order #{@repair_order_number}" },
          status: :ok
      else
        render json: { message: "There are no repair items to checkout for Repair Order #{@repair_order_number}" },
          status: :ok
      end

  end

  def show_checkout_history
    @repair_order_number = current_repair_order.repair_order_number
    @repair_items = current_repair_order.repair_items.each do |ri|
      if ri.checked_out == true
        render json: { repair_items_history: @repair_items.as_json(include: [:repair_order,
                                                                    :inventory_item]) },
          status: :ok
      else
        render json: { message: "There is no history of repair items attached to Repair Order #{@repair_order_number}" },
          status: :ok
      end
end
  end

end
