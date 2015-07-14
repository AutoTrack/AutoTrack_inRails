class InvoicesController < ApplicationController
before_action :authenticate_employee_user_with_token!
before_action :authenticate_business_user_with_token!


    def invoices_index
        @invoice = Invoice.all

            render json: {invoice: @invoice.as_json},
                status: :ok
    end

    def invoices_create
        @business_user = BusinessUser.find( params[ :id ] )
        @repair_order = RepairOrder.find( params[ :id ] )
        @client = Client.find( params[ :id ] )
        @vehicle = Vehicle.find( params[ :id ] )
        @invoice = @business_user.repair_orders.client.vehicle.invoices.new( invoice_url: params[ :invoice_url ],
                                                                                                                        invoice_status: params[ :invoice_status ] )

        if @invoice.save
            render json: { invoice: @business_user_id.repair_order.client.vehicle.invoice.as_json( only: [ :id, :business_user_id, :repair_order_id,
                                                                                        :client_id, :vehicle_id ] ) },
            status: :created
        end
    end

    def invoice_show
        @invoice = Invoice.find(params[ :id ] )
            render json: {invoice: @invoice.as_json },
                status: :ok
    end

    def invoice_update
        @invoice = Invoice.find( params[ :id ] )

        if @invoice.update(invoice_status: params[ :invoice_stauts ] )

            render json: { invoice: @invoice.as_json },
                status: :created
        end

    end

    def invoice_delete
        @invoice = Invoice.find( params[ :id ] )

        if @invoice.destroy
            render json: {message: "Invoice has been deleted"},
                status: :gone
        end
    end



protected
    def taxes


    end

end
