class TopicsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def show
    @topic = Topic.find_by_id(params[:id])
  end

  def index
    @topics = Topic.all
  end

  

  
end
