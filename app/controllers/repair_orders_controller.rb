class RepairOrdersController < ApplicationController
# This retrieves all repair orders in existance.
  def repair_orders_index
    @repair_orders = RepairOrder.all
    render json: { repair_orders: @repair_orders.as_json },
     status: :ok
  end

# This retrieves all repair orders for the current business user.
  def business_repair_orders_index
    @repair_orders = current_business_user.repair_orders.all
    if @repair_orders
    render json: { repair_orders: @repair_orders.as_json },
     status: :ok
   else
     render json: { repair_orders: @repair_orders.error.full_messages },
     status: :unprocessable_entity
   end
  end

# This retrieves all repair orders for the current employee user.
  def employee_repair_orders_index
    @repair_orders = current_employee_user.repair_orders.all
    if @repair_orders
    render json: { repair_orders: @repair_orders.as_json },
     status: :ok
   else
     render json: { repair_orders: @repair_orders.error.full_messages },
     status: :unprocessable_entity
   end
  end

# This will be used in the creation of a RO Number page.
  def repair_order_create
    @repair_order = current_business_user.repair_orders.new(repair_order_number: params[:repair_order_number])
    if @repair_order.save
    render json: { repair_order: @repair_order.as_json },
      status: :created
    else
      render json: { errors: @repair_order.errors.full_messages },
      status: :unprocessable_entity
    end
  end

# This will attach employee to RO after the RO has been created.
  def repair_order_employees
    @repair_order = current_business_user.


  # def repair_order_show
  #   @repair_order = RepairOrder.find(params[:id])
  #
  #   if @repair_order.save
  #    # render json "show.json.jbuilder", status: :ok
  #    render json: { repair_order: @repair_order.as_json(include: { client: { only: [:client_first_name, :client_last_name] } } ),
  #        status: :ok
  #    else
  #      render json: { errors: @post.errors.full_messages },
  #        status: :not_found
  #    end
  # end


  def repair_order_update
  end

  def repair_order_destroy
  end

end
