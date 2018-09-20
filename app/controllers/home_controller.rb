class HomeController < ApplicationController
  def index
    @news = Article.where(slider: true)
    puts @news.inspect
  end
end
