class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:show]
  skip_before_action :verify_authenticity_token, only: :create

  # Do we need this?
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to lists_path
    else
      flash.now[:message] = "Sign up failed: #{@user.errors.full_messages.join("\n")}"
      render 'users/new'
    end
  end

  def show
    @lists = List.where(user_id: current_user)
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
