class ListsController < ApplicationController
  include ListsHelper
  before_action :redirect_if_not_logged_in
  
  def index
    if params[:topic_id] && @topic = Topic.find_by_id(params[:topic_id])
      @lists = List.where("topic_id = '#{@topic.id}'")
    else
      @error = "that topic does not exist" if params[:topic_id]
      @lists = List.all
    end
  end

  def new
    if params[:topic_id] && @topic = Topic.find_by_id(params[:topic_id])
      @list= @topic.lists.build
    else
      @error = "that topic does not exist" if params[:topic_id]
      @list = List.new
      @list.build_topic unless params[:topic_id] && @topic
    end
  end

  def create
    @list = current_user.lists.build(list_params)
    if params[:topic_id] == params[:list][:topic_id]
      if @list.save
        redirect_to lists_path(@list)
      else
        render :new 
      end
    elsif !params[:topic_id] && @list.topic= Topic.find_or_create_by(name: list_params[:topic_attributes][:name])
      if @list.save
        redirect_to lists_path(@list)
      else
        render :new 
      end
    else
      binding.pry
      @error = "Please use the 'Make a List' Tab if you want to change topics."
      render :new
    end
  end

  def edit
    @list = List.find_by_id(params[:id])
  end

  def update
    @list = List.find_by_id(params[:id])
    if params[:list][:topic_id]
      if @list.update(list_params)
        redirect_to lists_path(@list)
      else
        render :edit 
      end
    elsif !params[:topic_id] && @list.topic= Topic.find_or_create_by(name: list_params[:topic_attributes][:name])
     if @list.update(list_params)
        redirect_to lists_path(@list)
      else
        render :edit
      end
    else
    binding.pry
      @error = "Something went wrong. Try again."
      render :edit
    end
  end

  def show
    @list = List.find_by_id(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:title, :description, :item_1, :item_2, :item_3, :item_4, :item_5, :item_6, :item_7, :item_8, :item_9, :item_10, :topic_id, topic_attributes: [:name])
  end


end
