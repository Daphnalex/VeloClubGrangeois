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
      if @report.errors.to_hash(:file)
        @error_report_file = "Votre fichier présente un problème"
      end
      render :new
    end
  end


  private

    def report_params
      params.require(:report).permit(:title, :file)
    end

end
