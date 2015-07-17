json.busines_user do |json|
    json.(@inv_item, :id, :business_user_name, :business_user_name,
                                                        :business_user_email, :business_user_street,
                                                        :business_user_city, :business_user_state,
                                                        :business_user_zipcode)
end
json.array! @inv_item do | inv_item |
    json.id                                         inv_item.id
    json.part_number                        inv_item.part_number
    json.business_part_number        inv_item.business_part_number
    json.category                               inv_item.category
    json.inventory_item_location       inv_item.inventory_item_location
    json.inventory_item_supplier       inv_item.inventory_item_supplier
    json.reorder_alert                        inv_item.reorder_alert
    json.order_to_quantity                 inv_item.order_to_quantity
    json.inventory_item_billable         inv_item.inventory_item_billable
    json.inventory_item_taxable        inv_item.inventory_item_taxable
    json.inventory_item_cost             inv_item.inventory_item_cost
    json.inventory_item_markup        inv_item.inventory_item_markup
    json.inventory_count                    inv_item.inventory_count
    json.tool                                       inv_item.tool
end