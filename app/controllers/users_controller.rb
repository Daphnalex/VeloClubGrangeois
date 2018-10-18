class UsersController < ApplicationController
  before_action :must_be_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
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
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    binding.pry
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      if current_user.admin == true
        binding.pry
        redirect_to users_path
      else
        binding.pry
        redirect_to user_path(params[:id])
      end
    else
      render :edit
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

  def user_params
    params.require(:user).permit(:email, :admin, :firstname, :lastname)
  end

  def must_be_admin
    unless current_user && current_user.admin == true
      redirect_to users_path, notice: "Vous n'avez pas les droits pour effectuer cette action."
    end
  end

end
