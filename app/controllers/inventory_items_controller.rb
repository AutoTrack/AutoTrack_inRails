class InventoryItemsController < ApplicationController
  before_action :authenticate_business_user_with_token!
  before_action :authenticate_employee_user_with_token!

    def inventory_items_index
        @inv_item = InventoryItem.all

        render json: {inv_item: @inv_item.as_json},
        status: :ok
    end

    def business_inventory_items_index
        @inv_item = current_business_user.inventory_items.all

        render json: {inv_item: @inv_item.as_json},
        status: :ok
    end

    def inventory_items_create
        @inv_item = current_business_user.inventory_items.find_or_create_by(
                                      part_number: params[:part_number],
                                      part_name: params[:part_name],
                                      business_part_number: params[:business_part_number],
                                      category: params[:category],
                                      inventory_item_location: params[:inventory_item_location],
                                      inventory_item_supplier: params[:inventory_item_supplier],
                                      reorder_alert: params[:reorder_alert],
                                      order_to_quantity: params[:order_to_quantity],
                                      inventory_item_billable: params[:inventory_item_billable],
                                      inventory_item_taxable: params[:inventory_item_taxable],
                                      inventory_item_cost: params[:inventory_item_cost],
                                      inventory_item_markup: params[:inventory_item_markup],
                                      inventory_count: params[:inventory_count],
                                      tool: params[:tool])
        if @inv_item.save
          render json: {inv_item: @inv_item.as_json},
          status: :created
        else
          render json: { errors: @client.errors.full_messages },
          status: :unprocessable_entity
        end
    end

    def inventory_item_show
        @inv_item = current_business_user.inventory_items.find(params[:id])

        render json: {inv_item: @inv_item.as_json},
        status: :ok

    end

    def inventory_item_update
        @inv_item = current_business_user.inventoryitem.find(params[:id])
        @inv_item.update(part_number: params[:part_number],
                         part_name: params[:part_name],
                         business_part_number: params[:business_part_number],
                         category: params[:category],
                         inventory_item_location: params[:inventory_item_location],
                         inventory_item_supplier: params[:inventory_item_supplier],
                         reorder_alert: params[:reorder_alert],
                         order_to_quantity: params[:order_to_quantity],
                         inventory_item_billable: params[:inventory_item_billable],
                         inventory_item_taxable: params[:inventory_item_taxable],
                         inventory_item_cost: params[:inventory_item_cost],
                         inventory_item_markup: params[:inventory_item_markup],
                         inventory_count: params[:inventory_count],
                         tool: params[:tool])

        render json: {inv_item: @inv_item.as_json},
        status: :created
    end

    def inventory_item_destroy
        @inv_item = current_business_user.inventory_items.find(params[:id])
        @inv_item.destroy

        render json: {inv_item: @inv_item.as_json},
        status: :gone
    end

end
