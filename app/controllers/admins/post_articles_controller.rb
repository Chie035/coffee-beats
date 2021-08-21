class Admins::PostArticlesController < ApplicationController
  def index
    @post_articles = PostArticle.all
  end

  def show
    @post_article = PostArticle.find(params[:id])
  end

  def destroy
    @post_article = PostArticle.find(params[:id])
    @post_article.destroy


    redirect_to admins_users_path
  end
end
