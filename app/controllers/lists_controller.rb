class ListsController < ApplicationController
  before_action :redirect_if_not_logged_in
  include ListsHelper

  def index
    if search_params[:search]
      @lists = List.search_lists(params[:search])
    elsif nested_topic?
      @lists = List.where(topic_id: @topic.id)
    else
      @error = 'Unable to find topic.' if params[:topic_id]
      @lists = List.order_recent.includes(:user)
    end
  end

  def new
    @list = List.new
    @list.topic = Topic.find_or_initialize_by(id: params[:topic_id])
    @list.topic_id = params[:topic_id] if nested_topic?

    if !Topic.exists?(id: params[:topic_id])
      @error = 'Unable to find topic.' if params[:topic_id]
      render :new
    end
  end

  def create
    @list = current_user.lists.build(list_params)
    @list.topic = Topic.find_by_id(params[:topic_id]) if nested_topic?

    if @list.save
      redirect_to lists_path
      flash[:notice] = 'Your list has been successfully created.'
    elsif @list.topic && !@list.save
      render action: :new, topic_id: @list.topic.id
      flash[:message] = 'Something went wrong List did not save.'
    else
      render :new
    end
  end

  def edit
    @list = List.find_by_id(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
      flash[:notice] = 'List successfully updated.'
    else
      render :edit
    end
  end

  def show
    unless List.find(params[:id])
      redirect_to lists_path
      flash[:message] = 'List does not exist.'
    end
    @list = List.find(params[:id])
  end

  def destroy
    List.destroy(params[:id])
    redirect_to user_path(current_user)
  end

  private

  def list_params
    params.require(:list).permit(:title, :description, :item_1, :item_2, :item_3, :item_4, :item_5, :item_6, :item_7, :item_8, :item_9, :item_10, :topic_id, topic_attributes: [:name])
  end

  def search_params
    params.permit(:search, :commit)
  end
end
