namespace :counters do
  desc 'Updates Topic#lists_count counter caches'
  task update: :environment do
    Topic.find_each do |topic|
      Topic.reset_counters(topic.id, :lists_count)
    end
  end
end
