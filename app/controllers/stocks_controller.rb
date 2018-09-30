class StocksController < ApplicationController

  def index
    @stocks = Stock.all
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.valid?
      @stock.date = Time.now
      @stock.save
      redirect_to stocks_path
    else
      if @stock.errors.to_hash(:title)
        @error_stock_title = "Un titre est requis"
      end
      if @stock.errors.to_hash(:front_image)
        @error_stock_front_image = "Une photo de l'avant du t-shirt est requis"
      end
      if @stock.errors.to_hash(:back_image)
        @error_stock_back_image = "Une photo de l'arrière du t-shirt est requis"
      end
      if @stock.errors.to_hash(:quantity)
        @error_stock_quantity = "Indiquer la quantité de t-shirt disponible"
      end
      binding.pry
      render :new
    end
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    @stock.date = Time.now
    if @stock.update_attributes(stock_params)
      redirect_to stocks_path
    else
      render :edit
    end
  end

  def destroy
    @stock = Stock.find(params[:id])
    if @stock.destroy
      flash[:success] = "Vêtement supprimé du stock"
      redirect_to stocks_path()
    end
  end

  private
    def stock_params
      params.require(:stock).permit(:title, :front_image, :back_image, :quantity, :promotion, :home)
    end

end
