# == Schema Information
#
# Table name: meals
#
#  id              :integer          not null, primary key
#  food_group_name :string
#  food_item_name  :string
#  meal_name       :string
#  portion_size    :string
#  portions        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
class Meal < ApplicationRecord
end
