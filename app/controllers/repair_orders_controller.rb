class RepairOrdersController < ApplicationController
  before_action :authenticate_business_user_with_token!
  before_action :authenticate_employee_user_with_token!
# This retrieves all repair orders in existance.
  def repair_orders_index
    @repair_orders_index = RepairOrder.all
    render json: { repair_orders: @repair_orders_index.as_json },
     status: :ok
  end

# This retrieves all repair orders for the current business user.
  def business_repair_orders_index
    @business_repair_orders = current_business_user.repair_orders.all

   if @business_repair_orders
    # render json: { repair_orders: @business_repair_orders.as_json(include:=>{ [:client, :vehicle])} },
    respond_to do |format|
     format.json  { render :json => :client }
     format.json  { render :json => :vehicle }
   end
   else
     render json: { repair_orders: @business_repair_orders.error.full_messages },
     status: :unprocessable_entity
   end
  end

# This retrieves all repair orders for the current employee user.
  def employee_repair_orders_index
    @employee_repair_orders = current_employee_user.repair_orders.all
    if @employee_repair_orders
    render json: { repair_orders: @employee_repair_orders.as_json },
     status: :ok
   else
     render json: { repair_orders: @employee_repair_orders.error.full_messages },
     status: :unprocessable_entity
   end
  end

# This will be used in the creation of a RO Number page.
  def repair_order_create

    @business_id = current_business_user.id
    @client_id = current_client.id
    @repair_order = current_vehicle.repair_orders.new(
                                 repair_order_number: params[:repair_order_number],
                                 client_id: @client_id,
                                 business_user_id: @business_id)
    if @repair_order.save
      render json: { repair_order: @repair_order.as_json(include: :vehicle) },
      status: :created
    else
      render json: { errors: @repair_order.errors.full_messages },
      status: :unprocessable_entity
    end
  end


# Displays repair order, client info, and vehicle info.
  def repair_order_show

    @repair_order = current_business_user.repair_orders.find(params[:id])
    @repair_order_items = @repair_order.repair_items.all


    #  render json: { repair_order_items: @repair_order_items(include: =>{:repair_order} },
     render json: @repair_order.as_json(include:  @repair_order_items  ),
         status: :ok

  end


  def repair_order_destroy
    @delete_repair_order = current_business_user.repair_orders.find(params[:id])
    @delete_repair_order.destroy
    render json: { message: "Repair Order #{@delete_repair_order.id} has been removed from database" },
    status: :gone

  end

end
