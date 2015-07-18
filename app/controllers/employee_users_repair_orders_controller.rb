class EmployeeUsersRepairOrdersController < ApplicationController
  before_action :authenticate_employee_user_with_token!
  before_action :authenticate_business_user_with_token!
# This will attach employee to RO after the RO has been created.
  def repair_order_employees_create
    @business_id = current_business_user.id
    @client_id = current_client.id
    @vehicle_id = current_vehicle.id
    @repair_order = current_repair_order.employee_users_repair_orders.new(
                 business_user_id: @business_id,
                 client_id: @client_id,
                 vehicle_id: @vehicle_id,
                 employee_user_id: params[:employee_user_id])


    # @employee_user = current_business_user.employee_users.find(params[:employee_user_id])
    #
    # @repair_order.employee_users << @employee_user

      if @repair_order.save
        render json: { repair_order: @repair_order.as_json,
                       employee_users: @repair_order.employee_users_repair_orders.as_json },
        status: :created
      else
        render json: { errors: @repair_order_employee.errors.full_messages },
        status: :unprocessable_entity
      end
  end

  def repair_order_employees_show
    @repair_order = current_business_user.repair_orders.find(params[:id])

    @repair_order_employee = @repair_order.employee_users_repair_orders.find(params[:id])
    if @repair_order_employee.save
    end
  end

  def repair_order_employees_show_all
    @repair_order = current_business_user.repair_orders.find(params[:id])

    @repair_order_employees = @repair_order.employee_users_repair_orders.all

      render json: { employee_users: @repair_order_employees.employee_users_repair_orders.as_json },
      status: :ok
  end

# This will remove employee from repair order.
  def repair_order_employees_delete
    @repair_order = current_business_user.repair_orders.find(params[:id])
    @repair_order_employee = current_business_user.employee_users.where(
                                                :id => params[:employee_number])
    @repair_order.employee_users.destroy
    if @repair_order.employee_users.save
      render json: { repair_order_employees: @repair_order_employee.as_json },
      status: :ok
    else
      render json: { errors: @repair_order_employee.errors.full_messages },
      status: :unprocessable_entity
    end
  end
end
