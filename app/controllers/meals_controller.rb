class MealsController < ApplicationController
  def index
    matching_meals = Meal.where(:user_id => @current_user.id)

    @list_of_meals = matching_meals.order({ :created_at => :desc })

    render({ :template => "meals/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_meals = Meal.where({ :id => the_id })

    @the_meal = matching_meals.at(0)

    render({ :template => "meals/show.html.erb" })
  end

  def create
    the_meal = Meal.new
    the_meal.user_id = @current_user.id
    the_meal.meal_name = params.fetch("query_meal_name")
    the_meal.food_group_name = params.fetch("query_food_group_name")
    the_meal.portions = params.fetch("query_portions")
    the_meal.food_item_name = params.fetch("query_food_item_name")
    the_meal.portion_size = Fooditem.where({:food_item_name=>the_meal.food_item_name}).at(0).portion_size

    if the_meal.valid?
      the_meal.save
      redirect_to("/" + the_meal.meal_name.downcase, { :notice => "Meal created successfully." })
    else
      redirect_to("/" + the_meal.meal_name.downcase, { :notice => "Meal failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_meal = Meal.where({ :id => the_id }).at(0)

    the_meal.user_id = params.fetch("query_user_id")
    the_meal.meal_name = params.fetch("query_meal_name")
    the_meal.food_group_name = params.fetch("query_food_group_name")
    the_meal.portions = params.fetch("query_portions")
    the_meal.food_item_name = params.fetch("query_food_item_name")
    the_meal.portion_size = params.fetch("query_portion_size")

    if the_meal.valid?
      the_meal.save
      redirect_to("/meals/#{the_meal.id}", { :notice => "Meal updated successfully."} )
    else
      redirect_to("/meals/#{the_meal.id}", { :alert => "Meal failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_meal = Meal.where({ :id => the_id }).at(0)

    the_meal.destroy

    redirect_to("/meals", { :notice => "Meal deleted successfully."} )
  end
end
