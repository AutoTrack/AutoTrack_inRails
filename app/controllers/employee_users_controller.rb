class EmployeeUsersController < ApplicationController
  # skip_authorization_check
  before_action :authenticate_business_user_with_token!

  def index
    @employee_users = EmployeeUser.all
    render json: { employee_user: @employee_users.as_json(only: [:id, :employee_first_name,
                                                                 :employee_last_name,
                                                                 :employee_email,
                                                                 :employee_number]) },
     status: :created
  end

  def super_employee_register
     passhash = Digest::SHA1.hexdigest(params[:employee_password])
     @employee_user = current_business_user.employee_users.new(employee_email: params[:employee_email],
                                       employee_pin: params[:employee_pin],
                                       employee_password: passhash,
                                       employee_first_name: params[:employee_first_name],
                                       employee_last_name: params[:employee_last_name],
                                       employee_access_rights: params[:employee_access_rights],
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

  def employee_register
     passhash = Digest::SHA1.hexdigest(params[:employee_password])

     @employee_user = current_business_user.employee_users.new(employee_email: params[:employee_email],
                                       employee_pin: params[:employee_pin],
                                       employee_password: passhash,
                                       employee_first_name: params[:employee_first_name],
                                       employee_last_name: params[:employee_last_name],
                                       employee_access_rights: params[:employee_access_rights],
                                       employee_number: params[:employee_number],
                                       role: params[:role] )
     if @employee_user.save

       render json: { employee_user: @employee_user.as_json },
         status: :created
     else
       render json: { errors: @employee_user.errors.full_messages },
         status: :unprocessable_entity
     end
  end

  def employee_login
    passhash = Digest::SHA1.hexdigest(params[:employee_password])
    @employee_user = current_business_user.employee_users.find_by(employee_password: passhash,
                     employee_email: params[:employee_email])
    if @employee_user
      render json: { employee_user: @employee_user.as_json },
        status: :ok
    else
      render json: { message: "Invalid Login" },
        status: :unauthenticated
    end
  end

  def employee_pin_login
    @employee_user = current_business_user.employee_users.find_by(employee_pin: params[:employee_pin])
    if @employee_user

      render json: { employee_user: @employee_user.as_json },
        status: :ok
    else
      render json: { message: "Invalid Employee Pin" },
        status: :unauthenticated
    end
  end

end
