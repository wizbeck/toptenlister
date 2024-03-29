# frozen_string_literal: true

# Schema Information
# "title"       :string
# "description" :text
# "user_id"     :integer
# "topic_id"    :integer
# "item_1"      :string
# "item_2"      :string
# "item_3"      :string
# "item_4"      :string
# "item_5"      :string
# "item_6"      :string
# "item_7"      :string
# "item_8"      :string
# "item_9"      :string
# "item_10"     :string
# "created_at"  :datetime, precision: 6, null: false
# "updated_at"  :datetime, precision: 6, null: false

class List < ApplicationRecord
  # Default Scope
  default_scope { order(updated_at: :desc) }

  # Relationships
  belongs_to :user
  belongs_to :topic, counter_cache: true
  accepts_nested_attributes_for :topic, reject_if: proc { |attributes| attributes['name'].blank? }

  # Validations
  validates :title, presence: true
  validates :item_1, :item_2, :item_3, :item_4, :item_5, presence: true
  validates :description, length: { maximum: 100 }

  # Pagination
  paginates_per 25

  # TODO: search_lists is broken, find out whats happening
  def self.search_lists(search = nil)
    where('LOWER(title) LIKE ?', "%#{search.downcase}%")
  end

  def items
    [
      item_1, item_2, item_3, item_4, item_5,
      item_6, item_7, item_8, item_9, item_10
    ]
  end
end
