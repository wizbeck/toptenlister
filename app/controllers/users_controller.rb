class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:show]

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

  def show
    @lists = List.where(user_id: current_user)
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
