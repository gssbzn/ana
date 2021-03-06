# Father of all controllers
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  
  # Params sanitazion for devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :name, :lastname, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :name, :lastname, :password, :password_confirmation, :current_password) }
  end
  
  # Validate Current user is admin
  def is_administratior?
    if user_signed_in? # if user signed
      if current_user.admin? # if adminstrator return true
        true
      else
        redirect_to root_path, notice: 'No autorizado.'
      end
    else
      redirect_to new_user_session_path, notice: 'No autorizado.'
    end
  end
end
