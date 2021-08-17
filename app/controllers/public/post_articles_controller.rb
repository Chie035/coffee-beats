class Public::PostArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @post_articles = PostArticle.all.reverse_order
    @post_article = PostArticle.new
    @post_comment = PostComment.new
  end

  def create
    @post_article = PostArticle.new(post_article_params)
    @post_article.user_id = current_user.id
    @post_article.save!

    redirect_to post_articles_path
  end

  def show
    @post_article = PostArticle.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
  end

  private
  def post_article_params
    params.require(:post_article).permit(:body, :image, :user_id)
  end
end
