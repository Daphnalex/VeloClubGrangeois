class Users::InvitationsController < Devise::InvitationsController

  def create
    devise_parameter_sanitizer.for(:accept_invitation) do |u|
        u.permit(:firstname, :lastname, :rights)
    end
  end

end
