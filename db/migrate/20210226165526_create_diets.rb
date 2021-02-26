class CreateDiets < ActiveRecord::Migration[6.0]
  def change
    create_table :diets do |t|
      t.integer :user_id
      t.string :food_group_name
      t.integer :portions
      t.string :meal_name

      t.timestamps
    end
  end
end
