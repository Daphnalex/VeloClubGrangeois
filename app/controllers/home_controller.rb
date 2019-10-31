class HomeController < ApplicationController
  def index
  	@homepage = true
    @current_user = current_user

    @news = Article.where(slider: true)
    @exits_month = Exit.where(date: (Date.today - 20.days)..(Date.today + 20.days)).order("date ASC")
    @picture = Picture.find_by_id(1)
    @stocks = Stock.where(home: true)
  end
end
