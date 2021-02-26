class FooditemsController < ApplicationController
  def index
    matching_fooditems = Fooditem.all

    @list_of_fooditems = matching_fooditems.order({ :created_at => :desc })

    render({ :template => "fooditems/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_fooditems = Fooditem.where({ :id => the_id })

    @the_fooditem = matching_fooditems.at(0)

    render({ :template => "fooditems/show.html.erb" })
  end

  def create
    the_fooditem = Fooditem.new
    the_fooditem.food_group_name = params.fetch("query_food_group_name")
    the_fooditem.food_item_name = params.fetch("query_food_item_name")
    the_fooditem.portion_size = params.fetch("query_portion_size")

    if the_fooditem.valid?
      the_fooditem.save
      redirect_to("/fooditems", { :notice => "Fooditem created successfully." })
    else
      redirect_to("/fooditems", { :notice => "Fooditem failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_fooditem = Fooditem.where({ :id => the_id }).at(0)

    the_fooditem.food_group_name = params.fetch("query_food_group_name")
    the_fooditem.food_item_name = params.fetch("query_food_item_name")
    the_fooditem.portion_size = params.fetch("query_portion_size")

    if the_fooditem.valid?
      the_fooditem.save
      redirect_to("/fooditems/#{the_fooditem.id}", { :notice => "Fooditem updated successfully."} )
    else
      redirect_to("/fooditems/#{the_fooditem.id}", { :alert => "Fooditem failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_fooditem = Fooditem.where({ :id => the_id }).at(0)

    the_fooditem.destroy

    redirect_to("/fooditems", { :notice => "Fooditem deleted successfully."} )
  end
end
