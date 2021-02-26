# == Schema Information
#
# Table name: diets
#
#  id            :integer          not null, primary key
#  meal_name     :string
#  portions      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  food_group_id :string
#  user_id       :integer
#
class Diet < ApplicationRecord
end
