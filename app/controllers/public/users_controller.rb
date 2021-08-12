class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def resign
    @user = current_user
  end

  def withdraw
    @user = current_user
  end

end
