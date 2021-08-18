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

    if @post_article.save

      redirect_to post_articles_path
    else
      @post_articles = PostArticle.all.reverse_order
      @post_article = PostArticle.new
      @post_comment = PostComment.new

      flash.now[:alert] = "Attention! 本文を入力してください"
      render :index
    end
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
