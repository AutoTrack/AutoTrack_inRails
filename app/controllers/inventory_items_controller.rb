class InventoryItemsController < ApplicationController

    def inventory_items_all
        @inv_item = InventoryItem.all

        render json: {inv_item: @inv_item.as_json},
        status: :ok
    end

    def invetory_items_create
        @inv_item = InventoryItem.new(part_number: params[:part_number],
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
        @inv_item.save

        render json: {inv_item: @inv_item.as_json},
        status: :create
    end

    def inventory_item_show
        @inv_item = InventoryItem.find(params[:id])

        render json: {inv_item: @inv_item.as_json},
        status: :ok

    end

    def inventory_item_update
        @inv_item = InventoryItem.find(part_number: params[:part_number],
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
        @inv_item.save

        render json: {inv_item: @inv_item.as_json},
        status: :create
    end

    def inventory_item_destroy
        @inv_item = InventoryItem.find(params[:id])
        @inv_item.destroy

        render json: {inv_item: @inv_item.as_json},
        status: :gone
    end

end
