class PicturesController < ApplicationController
  before_action :must_be_admin, only: [:new, :create, :edit, :update, :destroy]
  
  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to root_path()
    else
      render :new
    end
  end

  def edit
    @picture = Picture.find_by_id(1)
    @picture = Picture.new if @picture.nil?
  end

  def update
    @picture = Picture.find(1)
    if @picture.update_attributes(picture_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

    def picture_params
      params.require(:picture).permit(:image_one, :image_two, :image_three, :image_four)
    end

    def must_be_admin
      unless current_user_is_admin?
        redirect_to root_path, notice: "Vous n'avez pas les droits pour effectuer cette action."
      end
    end
end
