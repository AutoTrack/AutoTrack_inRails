

json.array! @business_clients do |client|
    json.partial! 'clients', client: client
end