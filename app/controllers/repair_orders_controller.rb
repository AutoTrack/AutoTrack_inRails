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
    render json: { repair_orders: @business_repair_orders.as_json },
     status: :ok
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
    @repair_order = current_business_user.repair_orders.new(repair_order_number:
                                                            params[:repair_order_number])
    if @repair_order.save
      render json: { repair_order: @repair_order.as_json },
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

    if @repair_order_items
     render json: { repair_order: @repair_order_items },
         status: :ok
     else
       render json: { errors: @repair_order_items.errors.full_messages },
         status: :not_found
     end
  end


  def repair_order_destroy
    @delete_repair_order = current_business_user.repair_orders.find(params[:id])
    @delete_repair_order.destroy
    render json: { message: "Repair Order #{@delete_repair_order.id} has been removed from database" },
    status: :gone

  end

end
