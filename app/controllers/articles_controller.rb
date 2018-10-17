class ArticlesController < ApplicationController
  before_action :must_be_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      redirect_to article_path(@article.id)
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = "Article supprimé"
      redirect_to articles_path()
    else
      render :show
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :picture, :resume, :content, :slider)
  end

  def must_be_admin
    unless current_user && current_user.admin == true
      redirect_to articles_path, notice: "Vous n'avez pas les droits pour effectuer cette action."
    end
  end
end
