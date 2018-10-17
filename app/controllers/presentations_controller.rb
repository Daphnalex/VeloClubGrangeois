class PresentationsController < ApplicationController
  before_action :must_be_admin, only: [:new, :create, :edit, :update, :destroy]
  
  def edit
    @presentation = Presentation.find(params[:id])
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
      unless current_user && current_user.admin == true
        redirect_to clubs_path, notice: "Vous n'avez pas les droits pour effectuer cette action."
      end
    end
end
