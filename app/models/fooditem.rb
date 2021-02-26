# == Schema Information
#
# Table name: fooditems
#
#  id              :integer          not null, primary key
#  food_group_name :string
#  food_item_name  :string
#  portion_size    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Fooditem < ApplicationRecord
end
