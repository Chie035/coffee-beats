class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post_articles = @user.post_articles.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  def resign
    @user = current_user
  end

  def withdraw
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

end
