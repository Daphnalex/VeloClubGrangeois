class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:email, :firstname, :lastname, :admin])
  end

  protected

  def must_be_admin
    unless current_user && current_user.admin
      redirect_to request.referer || root_path, notice: "Vous n'avez pas les droits pour effectuer cette action."
    end
  end

end
