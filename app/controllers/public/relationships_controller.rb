class Public::RelationshipsController < ApplicationController

  def create
    following = current_user.follow(params[:user_id])
    following.save
    redirect_to request.referer
  end

  def destroy
    unfollowing = current_user.unfollow(params[:user_id])
    unfollowing.destroy

    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
