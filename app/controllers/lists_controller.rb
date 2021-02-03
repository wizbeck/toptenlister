class ListsController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def index
    @user = current_user
    @lists = List.all
  end

end
