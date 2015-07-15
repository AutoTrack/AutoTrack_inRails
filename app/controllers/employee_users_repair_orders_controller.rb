class EmployeeUsersRepairOrdersController < ApplicationController
  before_action :authenticate_employee_user_with_token!
  before_action :authenticate_business_user_with_token!
# This will attach employee to RO after the RO has been created.
  def repair_order_employees_create
    @repair_order = current_business_user.repair_orders.find(params[:id])

    @repair_order_employee = @repair_order.employee_users_repair_orders.new(employee_user_id: params[:employee_user_id])
    if @repair_order_employee.save
      render json: {repair_order_employee: @repair_order_employee.as_json(include:[:client,
                                                                                   :vehicle])},
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
      render json: {repair_order_employee: @repair_order_employee.as_json(include:[:client,
                                                                                   :vehicle])},
      status: :created
    else
      render json: { errors: @repair_order_employee.errors.full_messages },
      status: :unprocessable_entity
    end
  end

# This will remove employee from repair order.
  def repair_order_employees_delete
    @repair_order = current_business_user.repair_orders.find(params[:id])
    @repair_order_employee = current_business_user.employee_users.where(
                                                :id => params[:employee_number])
    @repair_order.employee_users.delete
    if @repair_order.employee_users.save
      render json: { repair_order_employees: @repair_order_employee.as_json },
      status: :ok
    else
      render json: { errors: @repair_order_employee.errors.full_messages },
      status: :unprocessable_entity
    end
  end
end
