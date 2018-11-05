class ReportsController < ApplicationController
  before_action :must_be_admin, only: [:new, :create, :edit, :update, :destroy]
  
  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.document = params[:report][:document]
    
    if @report.valid?
      
      @report.save
      redirect_to clubs_path
    else
      if @report.errors.to_hash(:title)
        
        @error_report_title = "Un titre est requis"
      end
      if @report.errors.to_hash(:document)
        
        @error_report_file = "Votre fichier présente un problème"
      end
      
      render :new
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update_attributes(report_params)
      redirect_to clubs_path
    else
      render :edit
    end
  end

  def destroy
    @report = Report.find(params[:id])
    if @report.destroy
      flash[:success] = "Compte-rendu supprimé"
      redirect_to clubs_path()
    end
  end

  private

  def report_params
    params.require(:report).permit(:title, :document)
  end

end
