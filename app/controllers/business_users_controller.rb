class BusinessUsersController < ApplicationController

  def index

  end

  def business_register
     passhash = Digest::SHA1.hexdigest(params[:password])
     @business_user = BusinessUser.new(business_user_email: params[:business_user_email],
                      password: passhash,
                      super_user_email: params[:super_user_email],
                      super_user_password: passhash,
                      business_name: params[:business_name],
                      business_street: params[:business_street],
                      business_state: params[:business_state],
                      business_zipcode: params[:business_zipcode],
                      business_logo: params[:business_logo])
     if @business_user.save
       # render json "register.json.jbuilder", status: :created
       render json: { business_user: @business_user.as_json(only: [:id, :email,
                                                            :access_token]) },
         status: :created
     else
       render json: { errors: @business_user.errors.full_messages },
         status: :unprocessable_entity
     end
   end

   def business_login
     passhash = Digest::SHA1.hexdigest(params[:business_user_password])
     @business_user = BusinessUser.find_by(business_user_password: passhash,
                      business_user_email: params[:business_user_email])||
                      BusinessUser.find_by(super_user_password: passhash,
                      business_user_email: params[:super_user_email])
     if @business_user

       render json: { user: @business_user.as_json(only: [:id, :email, :access_token]) },
         status: :ok
     else
       render json: { message: "Invalid Login" },
         status: :unauthenticated
     end
   end
 end
