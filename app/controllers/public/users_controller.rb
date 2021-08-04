class Public::UsersController < ApplicationController
  
  def show
    @user = User.find_by(name: params[:name])
  end
  
  def edit
  end
  
  def update
  end
  
  def resign
  end
  
  def withdraw
  end
  
end
