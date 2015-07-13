class VehiclesController < ApplicationController

    def vehicles_index
        @vehicles = Vehicle.all

        render json: {vehicle: @vehicles.as_json},
        status: :ok
    end

    def business_vehicles_index
        @business_vehicles = current_business_user.vehicles.all

        render json: {vehicle: @business_vehicles.as_json},
        status: :ok
    end

    def employee_vehicles_index
        @employee_vehicles = current_employee_user.vehicles.all

        render json: {vehicle: @employee_vehicles.as_json},
        status: :ok
    end

    def vehicles_create
        @client = Client.find(params[:client_id])
        @create_vehicle = @client.vehicles.create(client_id: @client.id,
                               vehicle_type: params[:vehicle_type],
                               vehicle_year: params[:vehicle_year],
                               vehicle_model: params[:vehicle_model],
                               vehicle_vin_number: params[:vehicle_vin_number],
                               vehicle_color: params[:vehicle_color],
                               vehicle_liscense_plate: params[:vehicle_liscense_plate],
                               vehicle_comment: params[:vehicle_comment])
        @create_vehicle.save

        render json: {vehicle: @create_vehicle.as_json(include: :client)},
        status: :create
    end

    def vehicle_show
        @vehicle = Vehicle.find(params[:id])

        render json: {vehicle: @vehicle.as_json(include: :client)},
        status: :ok
    end

    def vehicle_update
        @vehicle = Vehicle.find(params[:id])
        @vehicle.update(vehicle_type: params[:vehicle_type],
                        vehicle_year: params[:vehicle_year],
                        vehicle_model: params[:vehicle_model],
                        vehicle_vin_number: params[:vehicle_vin_number],
                        vehicle_color: params[:vehicle_color],
                        vehicle_liscense_plate: params[:vehicle_liscense_plate],
                        vehicle_comment: params[:vehicle_comment])

        render json: {vehicle: @vehicle.as_json},
        status: :create
    end

    def vehicle_destroy
        @vehicle  = Vehicle.find(params[:id])
        @vehicle.destroy

        render json: {vehicle: @vehicle.as_json}

    end

end
