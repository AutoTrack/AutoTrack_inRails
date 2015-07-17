json.busines_user do |json|
    json.(@inv_item.business_user, :id, :business_user_name, :business_user_name,
                                                        :business_user_email, :business_user_street,
                                                        :business_user_city, :business_user_state,
                                                        :business_user_zipcode)
end
json.inventory_items do |json|
json.(@inv_item, :id, :part_number, :business_part_number,
                            :category, :inventory_item_location, :inventory_item_supplier,
                            :reorder_alert, :order_to_quantity, :inventory_item_billable,
                            :inventory_item_taxable, :inventory_item_cost, :inventory_item_markup,
                            :inventory_count, :tool)
end
