class SessionsController < ApplicationController
  def welcome

  end

  def new

  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to lists_path
    else
      @error = "Incorrect username or password, please try again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  # Google oauth login for users who use google to log in to website
  def google
    @user = User.find_or_create_by(username: auth['info']['email']) do |user|
      user.password = SecureRandom.hex(10)
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to lists_path
    else
      redirect_to :root
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
