class EmployeeUsersController < ApplicationController

  before_action :authenticate_business_user_with_token!
  # skip_authorization_check

  # This will provide a list of all employees in existance.
  def index
    @all_employee_users = EmployeeUser.all
    render json: { employee_user: @all_employee_users.as_json(only: [:id, :employee_first_name,
                                                                 :employee_last_name,
                                                                 :employee_email,
                                                                 :employee_number]) },
     status: :created
  end


#This will provide a list of all employees associated with current business user.
  def index_by_business

    @business_employee_users = current_business_user.employee_users.all
    render json: { employee_user: @business_employee_users.as_json },
     status: :created
  end



# This allows you to create the first business user super employee with access
# rights to everything.
  def super_employee_register
     passhash = Digest::SHA1.hexdigest(params[:employee_password])
     @super_employee_user = current_business_user.employee_users.new(
                                       employee_email: params[:employee_email],
                                       employee_pin: params[:employee_pin],
                                       employee_password: passhash,
                                       employee_first_name: params[:employee_first_name],
                                       employee_last_name: params[:employee_last_name],
                                       employee_number: params[:employee_number],
                                       role: params[:role])

     if @super_employee_user.save
    #     BusinessUserMailer.new_business_user(@super_employee_user).deliver_now

       render json: { employee_user: @super_employee_user.as_json },
         status: :created
     else
       render json: { errors: @super_employee_user.errors.full_messages },
         status: :unprocessable_entity
     end
  end

# This is for the creation of a new employee user.
  def employee_register
     passhash = Digest::SHA1.hexdigest(params[:employee_password])

     @employee_user = current_business_user.employee_users.new(employee_email: params[:employee_email],
                                       employee_pin: params[:employee_pin],
                                       employee_password: passhash,
                                       employee_first_name: params[:employee_first_name],
                                       employee_last_name: params[:employee_last_name],
                                       employee_number: params[:employee_number],
                                       role: params[:role])
     if @employee_user.save

       render json: { employee_user: @employee_user.as_json },
         status: :created
     else
       render json: { errors: @employee_user.errors.full_messages },
         status: :unprocessable_entity
     end
  end

# This is for employee user login.
  def employee_login
    passhash = Digest::SHA1.hexdigest(params[:employee_password])

    @login_employee_user = current_business_user.employee_users.find_by(employee_password: passhash,
                     employee_email: params[:employee_email])
    if @login_employee_user
      render json: { employee_user: @login_employee_user.as_json },
        status: :ok
    else
      render json: { message: "Invalid Login" },
        status: :unauthenticated
    end
  end


# This is for logging in through pin feature.
  def employee_pin_login
    @pin_employee_user = current_business_user.employee_users.find_by(
                                                      employee_pin: params[:employee_pin])
    if @pin_employee_user

      render json: { employee_user: @pin_employee_user.as_json },
        status: :ok
    else
      render json: { message: "Invalid Employee Pin" },
        status: :unauthenticated
    end
  end

  def update_employee_user
    @update_employee = current_business_user.employee_users.find(params[:id])
    @update_employee.update(employee_email: params[:employee_email],
                            employee_pin: params[:employee_pin],
                            employee_password: params[:employee_password],
                            employee_first_name: params[:employee_first_name],
                            employee_last_name: params[:employee_last_name],
                            employee_number: params[:employee_number],
                            role: params[:role])
    if @update_employee.save
      render json: { employee_user: @update_employee.as_json },
        status: :ok

    else
      render json: { message: "Update employee unsuccessful" },
        status: :unauthenticated
    end
  end

  def delete_employee_user
    @delete_employee = current_business_user.employee_users.find(params[:id])
    @delete_employee.destroy
      render json: { employee_user: @delete_employee.as_json },
        status: :ok
  end

  def show_employee_user
    @show_employee = current_business_user.employee_users.find(params[:id])
      render json: { employee_user: @show_employee.as_json },
        status: :ok

  end
end
