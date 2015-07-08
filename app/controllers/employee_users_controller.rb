class EmployeeUsersController < ApplicationController

  def index
    @employee_users = EmployeeUser.all
    render json: { employee_user: @employee_users.as_json(only: [:id,
                                                                 :employee_email,
                                                                 :employee_password]) },
     status: :created
  end

  def employee_register
     pinhash = Digest::SHA1.hexdigest(params[:employee_pin])
     passhash = Digest::SHA1.hexdigest(params[:employee_password])
     @employee_user = EmployeeUser.new(employee_email: params[:employee_email],
                                       employee_pin: pinhash,
                                       employee_password: passhash,
                                       employee_first_name: params[:employee_first_name],
                                       employee_last_name: params[:employee_last_name],
                                       employee_access_rights: params[:employee_access_rights],
                                       super_user: params[:super_user])
     if @employee_user.save
       # render json "register.json.jbuilder", status: :created
       render json: { employee_user: @employee_user.as_json(only: [:id, :employee_first_name,
                                                            :employee_last_name,
                                                            :access_token2]) },
         status: :created
     else
       render json: { errors: @employee_user.errors.full_messages },
         status: :unprocessable_entity
     end
  end

  def employee_login
    passhash = Digest::SHA1.hexdigest(params[:employee_password])
    @employee_user = EmployeeUser.find_by(employee_password: passhash,
                     employee_email: params[:employee_email])
    if @employee_user

      render json: { employee_user: @employee_user.as_json(only: [:id, :employee_email,
                                                                  :access_token2]) },
        status: :ok
    else
      render json: { message: "Invalid Login" },
        status: :unauthenticated
    end
  end

  def employee_pin_login
    pinhash = Digest::SHA1.hexdigest(params[:employee_pin])
    @employee_user = EmployeeUser.find_by(employee_pin: pinhash)
    if @employee_user

      render json: { employee_user: @employee_user.as_json(only: [:id, :employee_email,
                                                                  :access_token2]) },
        status: :ok
    else
      render json: { message: "Invalid Employee Pin" },
        status: :unauthenticated
    end
  end

end
