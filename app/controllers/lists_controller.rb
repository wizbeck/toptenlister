class ListsController < ApplicationController
  include ListsHelper
  before_action :redirect_if_not_logged_in
  before_action :nested_topic?, only: [:index]

  def index
    @page = params[:page] || 1
    @search = params[:search] || ''

    @lists = List.includes(:user).search_lists(@search).page(@page)

    respond_to do |format|
      format.html { flash.now[:error] = 'Unable to find topic.' if params[:topic_id]
                    render collection: @lists }
    end
  end

  def new
    @list = List.new
    @list.topic = Topic.find_or_initialize_by(id: params[:topic_id])
    @list.topic_id = params[:topic_id] if nested_topic?

    if !Topic.exists?(params[:topic_id])
      @error = 'Unable to find topic.' if params[:topic_id]
      render :new
    end
  end

  def create
    @list = current_user.lists.build(list_params)
    @list.topic = Topic.find_by_id(params[:topic_id]) if nested_topic?

    if @list.save
      redirect_to lists_path
      flash[:notice] = 'Your List was successfully created.'
    elsif @list.topic && !@list.save
      render action: :new, topic_id: @list.topic.id
      flash[:message] = 'Something went wrong. Your List did not save.'
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
    if List.exists?(params[:id])
      @list = List.includes(:topic).find(params[:id])
    else
      flash[:message] = 'List does not exist.'
      redirect_to lists_path
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.delete
      flash[:notice] = "Deleted #{@list.title}"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Something went wrong. Could not delete List #{@list.title}"
      redirect_to :root
    end
  end

  private

  def list_params
    params.require(:list).permit(
      :title, :description, :item_1, :item_2, :item_3, :item_4,
      :item_5, :item_6, :item_7, :item_8, :item_9, :item_10,
      :topic_id, topic_attributes: [:name]
    )
  end
end
