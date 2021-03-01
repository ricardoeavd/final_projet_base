namespace :slurp do
  desc "TODO"
  task food_items: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "Food_Item_List.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      puts row.to_hash
      f = Fooditem.new 
      f.food_group_name = row["Food_Group_Name"]
      f.food_item_name = row["Food_Item_Name"]
      f.portion_size = row["Portion_Size"]
      f.save

      puts "#{f.food_item_name} saved"
    end
  
    puts "There are now #{Fooditem.count} rows in the FoodItem table"

  end

end

#  id              :integer          not null, primary key
#  food_group_name :string
#  food_item_name  :string
#  portion_size    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
