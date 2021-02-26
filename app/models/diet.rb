# == Schema Information
#
# Table name: diets
#
#  id              :integer          not null, primary key
#  food_group_name :string
#  meal_name       :string
#  portions        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
class Diet < ApplicationRecord
end
