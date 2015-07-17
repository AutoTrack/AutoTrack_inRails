json.employee_user do |json|
    json.(@employee_clients.employee_user, :id, :employee_email, :employee_pin,
                                              :employee_first_name, :employee_last_name,
                                              :employee_number, :role)

end


json.(@employee_clients, :id, :client_first_name, :client_last_name, :client_street_address,
                   :client_city, :client_state, :client_zipcode, :client_primary_phone,
                   :client_secondary_phone, :client_email )
