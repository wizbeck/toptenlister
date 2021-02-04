class ListsController < ApplicationController
  include ListsHelper
  before_action :redirect_if_not_logged_in
  
  def index
    @lists = List.all
  end

  def show
    @list = List.find_by_id(params[:id])
    
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    add_topic_to_list
    if @list.save
      redirect_to lists_path
    else
      render :new 
    end


  end

  private

  def list_params
    params.require(:list).permit(:title, :description, :item_1, :item_2, :item_3, :item_4, :item_5, :item_6, :item_7, :item_8, :item_9, :item_10, :topics)
  end


end
