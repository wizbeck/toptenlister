class ApplicationController < ActionController::Base
  # helpers give access to methods in views and controllers
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    # TODO: change to flash[:notice] or :info
    flash[:info] = 'You must be logged in to do that.'
    redirect_to root_path unless logged_in?
  end
end
