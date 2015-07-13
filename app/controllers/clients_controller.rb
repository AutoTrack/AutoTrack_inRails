class ClientsController < ApplicationController

    def clients_index
        @client = Client.all
        render json: { client: @client.as_json},
        status: :ok
    end

    def business_clients_index
        @client = business_user.clients.all
        render json: { client: @client.as_json},
        status: :ok
    end

    def employee_clients_index
        @client = current_employee_user.clients.all
        render json: { client: @client.as_json},
        status: :ok
    end

    def clients_create
        @client = current_business_user.clients.new(client_first_name: params[:client_first_name],
                             client_last_name: params[:client_last_name],
                             client_street_address: params[:client_street_address],
                             client_city: params[:client_city],
                             client_state: params[:client_state],
                             client_zipcode: params[:client_zipcode],
                             client_primary_phone: params[:client_primary_phone],
                             client_secondary_phone: params[:client_secondary_phone],
                             client_email: params[:client_email])
        if @client.save
            render json: {client: @client.as_json},
                status: :created
        else
            render json: { errors: @client.errors.full_messages },
                status: :unprocessable_entity # 422 code, something wrong with data
        end
    end

    def client_show
        @client = Client.find(params[:id])

        render json: {client: @client.as_json},
        status: :ok

    end

    def client_update
        @client = Client.find(params[:id])
        @client.update(client_first_name: params[:client_first_name],
                                client_last_name: params[:client_last_name],
                                client_street_address: params[:client_street_address],
                                client_city: params[:client_city],
                                client_state: params[:client_state],
                                client_zipcode: params[:client_zipcode],
                                client_primary_phone: params[:client_primary_phone],
                                client_secondary_phone: params[:client_secondary_phone],
                                client_email: params[:client_email])

        render json: {client: @client.as_json},
        status: :created
    end

    def  client_destroy
        @client = Client.find(params[:id])
        @client.destroy

        render json: {client: @client.as_json},
        status: :gone
    end
end
