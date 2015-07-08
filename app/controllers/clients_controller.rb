class ClientsController < ApplicationController

    def clients_index
        @client = Client.all
        render json: { client: @client.as_json},
        status: :ok
    end

    def clients_create

        @client = Client.create(client_first_name: params[:client_first_name],
                                            client_last_name: params[:client_last_name],
                                            client_street_address: params[:client_street_address],
                                            client_city: params[:client_city],
                                            client_state: params[:client_state],
                                            client_zipcode: params[:client_zipcode],
                                            client_primary_phone: params[:client_primary_phone],
                                            client_secondary_phone: params[:client_secondary_phone],
                                            client_email: params[:client_email])
        @client.save

        render json:{client: @client.as_json},
        status: :created
    end

    def client_show
        @client = Client.find(id: params[:id])

        render json: {client: @client.as_json},
        status: :ok
    end

    def client_update
        @client = Client.find(id: params[:id])
        @client.update

        render json: {client: @client.as_json},
        status: :created
    end

    def  client_destroy
        @client = Client.find(id: params[:id])
        @client.destroy!

        render json: {client: @client.as_json},
        status: :gone
    end
end
