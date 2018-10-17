class UsersController < ApplicationController
  before_action :must_be_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    binding.pry
  end

  def create
    @user = User.new(user_params)
    @user.rights = @user.rights.split('"')[1]
    binding.pry
    if @user.valid?
      binding.pry
      @user.save
      redirect_to users_path
    else
      binding.pry
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "Membre supprimé"
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :rights)
  end

  def must_be_admin
    unless current_user && current_user.rights == "admin"
      redirect_to users_path, notice: "Vous n'avez pas les droits pour effectuer cette action."
    end
  end

end
