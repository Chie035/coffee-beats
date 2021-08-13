class Admins::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post_articles = @user.post_articles.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    
    redirect_to admins_users_path(@user)
  end
  
  private
  def user_params
    params.require(:user).permit(:is_active)
  end
end
