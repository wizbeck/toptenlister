class List < ApplicationRecord
  belongs_to :user
  belongs_to :topic
   accepts nested_attributes
end
