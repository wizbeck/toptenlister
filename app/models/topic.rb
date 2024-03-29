# frozen_string_literal: true

# Schema Information
# "name" :string
# "created_at" :datetime, precision: 6, null: false
# "updated_at" :datetime, precision: 6, null: false
# "lists_count" :integer, counter_cache

class Topic < ApplicationRecord
  # Relationships
  has_many :lists
  has_many :users, through: :lists

  # Validations
  validates :name, uniqueness: true
  validates :name, presence: true
  validates :name, length: { maximum: 30 }

  # Scopes
  scope :by_most_lists, -> { left_joins(:lists).group('topics.id').order('count(lists.topic_id) desc') }

  def self.plucked_names
    pluck(:id, :name) do
      [id, name]
    end.to_h
  end
end
