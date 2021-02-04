class List < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  def items
    [self.item_1, self.item_2, self.item_3, self.item_4, self.item_5, self.item_6, self.item_7, self.item_8, self.item_9, self.item_10]
  end
end
