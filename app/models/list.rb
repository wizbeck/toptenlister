class List < ApplicationRecord
  # Schema Attributes
  # "title" string
  # "description" text
  # "user_id" integer
  # "topic_id" integer
  # "item_1" string
  # "item_2" string
  # "item_3" string
  # "item_4" string
  # "item_5" string
  # "item_6" string
  # "item_7" string
  # "item_8" string
  # "item_9" string
  # "item_10" string
  # "created_at" datetime, precision: 6, null: false
  # "updated_at" datetime, precision: 6, null: false

  # Relationships
  belongs_to :user
  belongs_to :topic
  accepts_nested_attributes_for :topic, reject_if: proc { |attributes| attributes['name'].blank? }
  # Validations
  validates :title, presence: true
  validates :item_1, :item_2, :item_3, :item_4, :item_5, presence: true
  validates :description, length: { in: 1..60 }

  # Scopes
  scope :order_recent, -> { order(updated_at: :desc) }

  def self.search_lists(search)
    where('title LIKE ?', "%#{search}%").order_recent
  end

  def items
    [self.item_1, self.item_2, self.item_3, self.item_4, self.item_5, self.item_6, self.item_7, self.item_8, self.item_9, self.item_10]
  end
end
