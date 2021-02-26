class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.integer :user_id
      t.string :meal_name
      t.string :food_group_name
      t.integer :portions
      t.string :food_item_name
      t.string :portion_size

      t.timestamps
    end
  end
end
