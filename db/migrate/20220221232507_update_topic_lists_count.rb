class UpdateTopicListsCount < ActiveRecord::Migration[6.1]
  def up
    Topic.find_each do |topic|
      Topic.reset_counters(topic.id, :lists)
    end
  end
end
