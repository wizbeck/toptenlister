class Topic < ApplicationRecord
  has_many :lists
  has_many :users, through: :lists
  #add scope by_popularity, to sort topics in order by their list count.
  #validations need to be added
end
