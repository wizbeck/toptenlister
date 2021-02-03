class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :topic_id
      t.string :item_1
      t.string :item_2
      t.string :item_3
      t.string :item_4
      t.string :item_5
      t.string :item_6
      t.string :item_7
      t.string :item_8
      t.string :item_9
      t.string :item_10
      t.timestamps
    end
  end
end
