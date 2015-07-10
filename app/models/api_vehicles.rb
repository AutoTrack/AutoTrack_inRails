class VehicleInventory
    include HTTParty

    base_uri 'https://api.edmunds.com/api/vehicle/v2/makes'
    EDMUNDS_KEY = ENV['EDMUNDS_KEY']

    def initialize
        @token = EDMUNDS_KEY
    end
end

