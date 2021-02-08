module ListsHelper

  def nested_topic?
    params[:topic_id] && @topic = Topic.find_by_id(params[:topic_id])
  end

end
