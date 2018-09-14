class ReportsController < ApplicationController

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
      binding.pry 
      render :new
    end
  end

  private

    def report_params
      params.require(:report).permit(:title, :document)
    end

end
