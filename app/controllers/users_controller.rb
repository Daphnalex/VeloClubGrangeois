class UsersController < ApplicationController
  before_action :must_be_admin, only: [:index, :destroy]

  def index
    @users = User.where.not(email: EMAIL_ADDRESS_CLUB)
  end

  def edit
    @user = User.find(params[:id])
    @for_admin = current_user.admin && @user != current_user
  end

  def show
    @user = current_user

  end

  def update
    @user = current_user

    if params[:user][:password]
      @user.update_attributes(password_params)

      # Sign in the user by passing validation in case their password changed
      flash[:success] = "Nouveau mot de passe enregistré"
      render :show
    elsif @user.update_attributes(user_params)
      if current_user.admin == true
        redirect_to users_path
      else
        
        render :show
      end
    else
      if @user.admin == true
        render :edit
      else
        render :edit_member
      end
    end

  end

  def destroy
    @user = User.find(params[:id]).destroy
    if @user.destroy
      flash[:success] = "Utilisateur supprimé"
      redirect_to users_path()
    end
  end

  private

  def self.all_except(user)
    where.not(id: user)
  end

  def user_params
    params.require(:user).permit(:email, :admin, :firstname, :lastname)
  end

  def password_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation)
  end

  def must_be_admin
    unless current_user && current_user.admin == true
      redirect_to users_path, notice: "Vous n'avez pas les droits pour effectuer cette action."
    end
  end

end
