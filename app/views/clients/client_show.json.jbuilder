json.busines_user do |json|
    json.(@show_client.business_user, :id, :business_user_name, :business_user_name,
                                                        :business_user_email, :business_user_street,
                                                        :business_user_city, :business_user_state,
                                                        :business_user_zipcode)

end
json.(@show_client, :id, :client_first_name, :client_last_name, :client_street_address,
                   :client_city, :client_state, :client_zipcode, :client_primary_phone,
                   :client_secondary_phone, :client_email )