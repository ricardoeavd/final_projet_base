class CreateFooditems < ActiveRecord::Migration[6.0]
  def change
    create_table :fooditems do |t|
      t.string :food_group_name
      t.string :food_item_name
      t.string :portion_size

      t.timestamps
    end
  end
end
