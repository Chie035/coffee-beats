class Admins::ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to admins_top_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    
    redirect_to admins_article_path(@article.id)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to admins_top_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :image)
  end

end
