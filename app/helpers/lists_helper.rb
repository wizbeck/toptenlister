module ListsHelper

  def add_topic_to_list
    @list.topic_id = params[:list][:topics][:topic_id]
  end
end
