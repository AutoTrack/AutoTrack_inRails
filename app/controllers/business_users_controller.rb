class BusinessUsersController < ApplicationController

  def index
    @business_users = BusinessUser.all
    render json: { business_user: @business_users.as_json(only: [:id,
                                                                 :business_user_email,
                                                                 :business_user_password]) },
     status: :created
  end

  def business_register
     passhash = Digest::SHA1.hexdigest(params[:business_user_password])
     passhash2 = Digest::SHA1.hexdigest(params[:employee_password])

     @business_user = BusinessUser.new(business_user_email: params[:business_user_email],
                      business_user_password: passhash,
                      business_user_name: params[:business_name],
                      business_user_street: params[:business_user_street],
                      business_user_city: params[:business_user_city],
                      business_user_state: params[:business_user_state],
                      business_user_zipcode: params[:business_user_zipcode],
                      business_logo_url: params[:business_logo_url],
                      business_user_cap: params[:business_user_cap])


     @employee_user = EmployeeUser.new(employee_email: params[:employee_email],
                      employee_pin: params[:employee_pin],
                      employee_password: passhash2,
                      employee_first_name: params[:employee_first_name],
                      employee_last_name: params[:employee_last_name],
                      super_user: true)

     if @business_user.save && @employee_user.save

       render json: { business_user: @business_user.as_json },

         status: :created
     else
       render json: { errors: @business_user.errors.full_messages },
         status: :unprocessable_entity
     end
  end

   def business_login
     passhash = Digest::SHA1.hexdigest(params[:business_user_password])
     @business_user = BusinessUser.find_by(business_user_password: passhash,
                      business_user_email: params[:business_user_email])
     if @business_user
       render json: { business_user: @business_user.as_json(only: [:id, :business_user_name, :access_token]) },
         status: :ok
     else
       render json: { message: "Invalid Login" },
         status: :unauthenticated
     end
   end
end
