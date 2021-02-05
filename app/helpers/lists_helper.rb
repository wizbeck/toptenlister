module ListsHelper

  def add_topic_to_list #if topic is created via form, create topic from params topic and set topic_id =, else find existing topic by id from db, and assign topic_id to list
    if params[:topic][:name]
      topic = Topic.find_or_create_by(name: params[:topic][:name])
      @list.topic_id = Topic.find_by_id(params[:list[:topic_id]])
    else  
    @list.topic_id = params[:list][:topic_id]
    end
  end
  
end
