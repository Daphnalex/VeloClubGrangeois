class PresentationsController < ApplicationController
  before_action :must_be_admin, only: [:new, :create, :edit, :update, :destroy]
  
  def edit
    @presentation = Presentation.find_by_id(params[:id]) || Presentation.new
  end

  def create
    @presentation = Presentation.new(presentation_params)

    if @presentation.save
      redirect_to clubs_path
    else
      render :new
    end
  end

  def update
    @presentation = Presentation.find(params[:id])

    if @presentation.update_attributes(presentation_params)
      redirect_to clubs_path
    else
      render :edit
    end
  end

  private

  def presentation_params
    params.require(:presentation).permit(:content)
  end

  def must_be_admin
    unless current_user_is_admin?
      redirect_to clubs_path, notice: "Vous n'avez pas les droits pour effectuer cette action."
    end
  end
end
