class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[new create]

  def welcome
  end

  # GET /signup
  def new
    render 'users/new'
  end

  # POST /signup
  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to lists_path
    else
      flash.now[:message] = 'Username or password incorrect, please try again.'
      render 'users/new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  # Google oauth login for users who use google to log in to website
  def google
    @user = User.find_or_create_by(username: auth['info']['email']) do |user|
      # creates a random password for users to login to bypass verficiation while also being secure
      user.password = SecureRandom.hex(20)
    end

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Successfully logged in!'
      redirect_to lists_path
    else
      flash[:alert] = 'Something went wrong. Please try again.'
      redirect_to :root
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
