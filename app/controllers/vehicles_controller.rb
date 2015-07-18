class VehiclesController < ApplicationController
  before_action :authenticate_business_user_with_token!
  before_action :authenticate_employee_user_with_token!

    def vehicles_index
        @vehicles = Vehicle.all

        render json: {vehicle: @vehicles.as_json},
        status: :ok
    end

    def business_vehicles_index
        @business_vehicles = current_business_user.vehicles.all

        render json: {vehicle: @business_vehicles.as_json },
        status: :ok
    end

    def employee_vehicles_index
        @employee_vehicles = current_employee_user.vehicles.all

        render json: {vehicle: @employee_vehicles.as_json},
        status: :ok
    end

    def vehicles_create
      @business_id = current_business_user.id
      @new_vehicle = current_client.vehicles.new(
                                                   business_user_id: @business_id,
                                                   vehicle_type: params[:vehicle_type],
                                                   vehicle_year: params[:vehicle_year],
                                                   vehicle_model: params[:vehicle_model],
                                                   vehicle_sub_model: params[:vehicle_sub_model],
                                                   vehicle_vin_number: params[:vehicle_vin_number],
                                                   vehicle_color: params[:vehicle_color],
                                                   vehicle_liscense_plate: params[:vehicle_liscense_plate],
                                                   vehicle_comment: params[:vehicle_comment])
      if @new_vehicle.save
        render json: {vehicle: @new_vehicle.as_json },
          status: :create
      else
        render json: { errors: @new_vehicle.errors.full_messages },
          status: :unprocessable_entity # 422 code, something wrong with data
      end
    end

    def vehicle_show
        @vehicle = current_business_user.vehicles.find(params[:id])

        render json: {vehicle: @vehicle.as_json(include: :client)},
        status: :ok
    end

    def vehicle_update
        @vehicle = current_business_user.vehicles.find(params[:id])
        @vehicle.update(vehicle_type: params[:vehicle_type],
                        vehicle_year: params[:vehicle_year],
                        vehicle_model: params[:vehicle_model],
                        vehicle_vin_number: params[:vehicle_vin_number],
                        vehicle_color: params[:vehicle_color],
                        vehicle_liscense_plate: params[:vehicle_liscense_plate],
                        vehicle_comment: params[:vehicle_comment])

        render json: {vehicle: @vehicle.as_json(include: :client)},
        status: :create
    end

    def vehicle_destroy
        @vehicle = current_business_user.vehicles.find(params[:id])
        @vehicle.destroy

        render json: { message: "Vehicle #{@vehicle.id} has been removed from client profile" },
        status: :gone
    end

end
