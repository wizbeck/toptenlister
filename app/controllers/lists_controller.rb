class ListsController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @user.lists.build(list_params)
  end

  private

  def list_params
    params.require(:list).()
end
