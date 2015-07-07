class BusinessUsersController < ApplicationController
  def business_register
     passhash = Digest::SHA1.hexdigest(params[:password])
     @business_user = BusinessUser.new(email: params[:email],
                      password: passhash)
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
     passhash = Digest::SHA1.hexdigest(params[:password])
     @business_user = BusinessUser.find_by(password: passhash,
                      email: params[:email])
     if @business_user

       render json: { user: @business_user.as_json(only: [:id, :email, :access_token]) },
         status: :ok
     else
       render json: { message: "Invalid Login" },
         status: :unauthenticated
     end
   end
 end
