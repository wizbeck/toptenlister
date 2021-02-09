class ListsController < ApplicationController
  include ListsHelper
  before_action :redirect_if_not_logged_in
  
  def index
    if nested_topic?
      @lists = List.where("topic_id = '#{@topic.id}'")
    else
      @error = "that topic does not exist" if params[:topic_id]
      @lists = List.all.reverse
    end
  end

  def new
    @list = List.new
    @list.topic = Topic.new
    if nested_topic?
      @list = List.new(topic_id: params[:topic_id])
    else
      @error = "That topic does not exist." if params[:topic_id]
      render :new
    end
      
  end

  def create
    if nested_topic?
      @list = current_user.lists.build(list_params)
      @list.topic = Topic.find_by_id(params[:topic_id])
    else
      @list = current_user.lists.build(list_params)
    end
    if @list.save
      redirect_to list_path(@list)
    elsif @list.topic && !@list.save
      render :action => "new", :topic_id => @list.topic.id
    else
      render :new
    end
  end

  def edit
    @list = List.find_by_id(params[:id])
  end

  def update
    @list = List.find_by_id(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def show
    if !@list = List.find_by_id(params[:id])
      redirect_to lists_path
      flash[:message] = "That list does not exist."
    end
  end

  def destroy
    List.destroy(params[:id])
    redirect_to user_path(current_user)
  end

  private

  def list_params
    params.require(:list).permit(:title, :description, :item_1, :item_2, :item_3, :item_4, :item_5, :item_6, :item_7, :item_8, :item_9, :item_10, :topic_id, topic_attributes: [:name])
  end


end
