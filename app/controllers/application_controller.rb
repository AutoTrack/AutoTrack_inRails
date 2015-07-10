class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  #CanCan---------------------------------------------------------------
  check_authorization
  # Renames curent_user to current_employee_user.
  # alias_method :current_user, :current_employee_user
  def current_ability
    @current_ability ||= Ability.new(current_employee_user)
  end
  #---------------------------------------------------------------------

  def current_business_user
    token = request.headers['Access-Token']
    token && BusinessUser.find_by(access_token: token)
  end

  def authenticate_business_user_with_token!
    unless current_business_user
      render json: { message: "Business Access Token Not Found." },
        status: :unauthenticated
    end
  end

  def current_employee_user
    token2 = request.headers['Access-Token2']
    token2 && EmployeeUser.find_by(access_token2: token2)
  end

  def authenticate_employee_user_with_token!
    unless current_employee_user
      render json: { message: "Employee Access Token Not Found." },
        status: :unauthorized
    end
  end
end
