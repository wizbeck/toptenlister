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
      flash[:message] = "Incorrect username or password, please try again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  

end