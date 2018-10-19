class HomeController < ApplicationController
  def index
    @current_user = current_user

    @news = Article.where(slider: true)
    @exits_month = Exit.where(date: Date.today.beginning_of_month..Date.today.end_of_month).order("date ASC")
    @picture = Picture.find(1)
    @stocks = Stock.all
  end
end
