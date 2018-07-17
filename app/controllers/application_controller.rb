class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  helper_method :mobile_device?

  protected
    def mobile_device?
      request.user_agent =~ /Mobile|webOS/
    end

	  def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
	    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation) }
	  end
end
