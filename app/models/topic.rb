class Topic < ApplicationRecord
  has_many :lists
  has_many :users, through: :lists
  #add scope by_popularity, to sort topics in order by their list count.
  validates :name, uniqueness: true, presence: true
  validates :name, length: { minimum: 30 }
end
