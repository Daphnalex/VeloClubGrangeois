class ClubsController < ApplicationController

  def index
    @clubs = Club.all
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    if @club.mail && @club.save
      redirect_to clubs_path
    else
      @club.mail = ""
      render :new
    end
  end

  def edit
    @club = Club.find(params[:id])
  end

  def show
    @club = Club.find(params[:id])
  end

  def destroy
    @club = Club.find(params[:id])
    if @club.destroy
      flash[:success] = "Membre supprimé"
      redirect_to clubs_path()
    else
      render :show
    end
  end

  private
    def club_params
      params.require(:club).permit(:title, :name, :telephone, :mail)
    end

end
