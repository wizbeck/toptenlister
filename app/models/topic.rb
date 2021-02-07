class Topic < ApplicationRecord
  has_many :lists
  has_many :users, through: :lists
  
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  scope :by_most_lists, -> {left_joins(:lists).group('topics.id').order('count(lists.topic_id) desc')}
  # Topic.left_joins(:lists).group('topics.id').order('count(topics.id) desc')
end
