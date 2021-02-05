module ListsHelper

def add_topic_to_list #if topic is created via form, create topic from params topic and set topic_id =, else find existing topic by id from db, and assign topic_id to list
  @list.topic = Topic.find_by_id(params[:list][:topic_id])
end
  
end
