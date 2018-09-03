class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    Article.new
  end
end
