class RepairOrdersController < ApplicationController

  def repair_orders_index
    @repair_orders = RepairOrder.all
    render json: { repair_orders: @repair_orders.as_json },
     status: :ok
  end

  def employee_repair_order_index
    @repair_orders = current_employee_user.repair_orders.all
    render json: { repair_orders: @repair_orders.as_json },
     status: :ok
  end

  def repair_order_create
    @repair_order = RepairOrder.new(repair_order_number: params[:repair_order_number])
    if @repair_order.save
    render json: { repair_order: @repair_order.as_json },
      status: :created
    else
      render json: { errors: @repair_order.errors.full_messages },
      status: :unprocessable_entity
    end
  end

  def add_repair_item_to_ro

    @repair_order = current_employee_user.repair_orders
  end
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
