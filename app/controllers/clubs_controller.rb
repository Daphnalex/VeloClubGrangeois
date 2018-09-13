class ClubsController < ApplicationController

  def index
    @clubs = Club.all
    @reports = Report.all
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    if @club.valid?
      @club.save
      redirect_to clubs_path
    else
      if @club.errors.to_hash[:title]
        @error_title = "Veuillez indiquer un intitulé de poste"
      end
      if @club.errors.to_hash[:name]
        @error_name = "Veuillez indiquer un nom"
      end
      if @club.errors.to_hash[:phone]
        @error_phone = "Numéro de téléphone invalide"
      end
      render :new
    end
  end

  def edit
    @club = Club.find(params[:id])
  end

  def update
    @club = Club.find(params[:id])
    if @club.update_attributes(club_params)
      redirect_to clubs_path
    else
      render :edit
    end
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
      params.require(:club).permit(:title, :name, :phone, :mail)
    end

end
