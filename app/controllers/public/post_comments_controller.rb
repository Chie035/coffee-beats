class Public::PostCommentsController < ApplicationController

  def create
    @post_image = PostArticle.find[:post_article_id]
    post_comment = current_user.post_comments.new(post_comment_params)
    post_comment.save

    redirect_to post_article_path(post_article)
  end

  def destroy
  end
  
  private
  def 

end
