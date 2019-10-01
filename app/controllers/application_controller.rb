class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:email, :firstname, :lastname, :admin])
  end

  def current_user_is_admin?
    current_user && current_user.admin
  end

end
