class VehiclesController < ApplicationController

    def vehicles_all
        @vehicle = Vehicle.all

        render json: {vehicle: @vehicle.as_json},
        status: :ok
    end

    def vehicles_create
        @vehicle = Vehicle.new(vehicle_type: params[:vehicle_type],
                               vehicle_year: params[:vehicle_year],
                               vehicle_model: params[:vehicle_model],
                               vehicle_vin_number: params[:vehicle_vin_number],
                               vehicle_color: params[:vehicle_color],
                               vehicle_liscense_plate: params[:vehicle_liscense_plate],
                               vehicle_comment: params[:vehicle_comment])
        @vehicle.save

        render json: {vehicle: @vehicle.as_json},
        status: :create
    end

    def vehicle_show
        @vehicle = Vehicle.find(params[:id])

        render json: {vehicle: @vehicle.as_json},
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
