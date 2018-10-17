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
    if @user.valid?
      @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:email, :rights)
  end

  def must_be_admin
    unless current_user && current_user.admin == true
      redirect_to users_path, notice: "Vous n'avez pas les droits pour effectuer cette action."
    end
  end

end
