class ExitsController < ApplicationController
  def index
    @exits = Exit.order('date ASC').page(params[:page]).per(7)
  end

  def new
    @exit = Exit.new
  end

  def create
    @exit = Exit.new(exit_params)
    if @exit.save
      redirect_to exits_path()
    else
      render :new
    end
  end

  def edit
    @exit = Exit.find(params[:id])
    @date = @exit.date.strftime("%d/%m/%Y")
    @exit.date = @date
  end

  def update
    @exit = Exit.find(params[:id])
    if @exit.update_attributes(exit_params)
      redirect_to exits_path()
    else
      render :edit
    end
  end

  def destroy
    @exit = Exit.find(params[:id])
    if @exit.destroy
      flash[:success] = "Sortie supprimée"
      redirect_to exits_path()
    else
      redirect_to exits_path()
    end
  end

  private

  def exit_params
    params.require(:exit).permit(:title, :description, :date, :city, :slider)
  end
end
