class UserController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = current_user.posts.all
  end

  def new
    User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to @user, notice: "Vous êtes connecté"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :rights)
    end
end
