class ClientsController < ApplicationController
  before_action :authenticate_business_user_with_token!
  before_action :authenticate_employee_user_with_token!
    def clients_index
        @clients = Client.all
        render json: { client: @clients.as_json},
        status: :ok
    end

    def business_clients_index
        @business_clients = current_business_user.clients.all
        render json: { client: @business_clients.as_json},
        status: :ok
    end

    def employee_clients_index
        @employee_clients = current_employee_user.clients.all
        render json: { client: @employee_clients.as_json},
        status: :ok
    end

    def clients_create
        @new_client = current_business_user.clients.new(client_first_name: params[:client_first_name],
                                                    client_last_name: params[:client_last_name],
                                                    client_street_address: params[:client_street_address],
                                                    client_city: params[:client_city],
                                                    client_state: params[:client_state],
                                                    client_zipcode: params[:client_zipcode],
                                                    client_primary_phone: params[:client_primary_phone],
                                                    client_secondary_phone: params[:client_secondary_phone],
                                                    client_email: params[:client_email])
        if @new_client.save
            render json: {client: @new_client.as_json},
                status: :created
        else
            render json: { errors: @new_client.errors.full_messages },
                status: :unprocessable_entity # 422 code, something wrong with data
        end
    end

    def client_show
        @show_client = current_business_user.clients.find(params[:id])

        render json: {client: @show_client.as_json},
        status: :ok

    end

    def client_update
        @update_client = current_business_users.clients.find(params[:id])
        @update_client.update(client_first_name: params[:client_first_name],
                       client_last_name: params[:client_last_name],
                       client_street_address: params[:client_street_address],
                       client_city: params[:client_city],
                       client_state: params[:client_state],
                       client_zipcode: params[:client_zipcode],
                       client_primary_phone: params[:client_primary_phone],
                       client_secondary_phone: params[:client_secondary_phone],
                       client_email: params[:client_email])

        render json: {client: @update_client.as_json},
        status: :created
    end

    def  client_destroy
        @destroy_client = current_business_user.clients.find(params[:id])
        @destroy_client.destroy

        render json: { message: "Client id: #{@destroy_client.id} has been removed from inventory" },
        status: :gone
    end
end
