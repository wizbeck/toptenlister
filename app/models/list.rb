class List < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  accepts_nested_attributes_for :topic, reject_if: proc { |attributes| attributes['name'].blank? }
#validations need to be added
  validates :title, presence: true
  validates :item_1, :item_2, :item_3, :item_4, :item_5, presence: true
  validates :description, length: { in: 1..60 }
  
   # scope :newest -> { order('created at') }
  

  def items
    [self.item_1, self.item_2, self.item_3, self.item_4, self.item_5, self.item_6, self.item_7, self.item_8, self.item_9, self.item_10]
  end



end
