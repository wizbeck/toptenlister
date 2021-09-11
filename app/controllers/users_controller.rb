class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to lists_path
    else  
      render :new
    end
  end

  def show #takes to current_user's account page listing all their lists
    redirect_if_not_logged_in
    @user = User.find(session[:user_id])
    @lists = @user.lists
  end

  private

  def user_params
      params.require(:user).permit(:username, :password)
  end


end