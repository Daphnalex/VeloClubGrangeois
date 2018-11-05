class PresentationsController < ApplicationController
  before_action :must_be_admin, only: [:edit, :update]
  
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

end
