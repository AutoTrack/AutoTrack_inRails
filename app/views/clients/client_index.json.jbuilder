json.array! @clients do |client|
   json.partial! 'clients', client: client
end