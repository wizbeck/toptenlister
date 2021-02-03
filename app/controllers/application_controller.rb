class ApplicationController < ActionController::Base
  #helpers give access to methods in views
helper_method :current_user, :logged_in?
  
def current_user
  @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
end

def logged_in?
  !!session[:user_id]
end

def redirect_if_not_logged_in
  if !logged_in?
    redirect_to root_path
  end
end

end
