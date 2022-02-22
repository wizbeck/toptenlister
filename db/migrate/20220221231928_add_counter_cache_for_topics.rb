class AddCounterCacheForTopics < ActiveRecord::Migration[6.1]
  def change
    add_column :topics, :lists_count, :integer
  end
end
