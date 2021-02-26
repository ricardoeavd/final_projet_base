class DietsController < ApplicationController
  def index
    matching_diets = Diet.where(:user_id => @current_user.id)

    @list_of_diets = matching_diets.order({ :meal_name => :desc })

    render({ :template => "diets/index.html.erb" })
  end

  def create
    the_diet = Diet.new
    the_diet.user_id = @current_user.id
    the_diet.food_group_name = params.fetch("query_food_group_name")
    the_diet.portions = params.fetch("query_portions")
    the_diet.meal_name = params.fetch("query_meal_name")

    if the_diet.valid?
      the_diet.save
      redirect_to("/", { :notice => "Diet created successfully." })
    else
      redirect_to("/", { :notice => "Diet failed to create successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_diet = Diet.where({ :id => the_id }).at(0)

    the_diet.destroy

    redirect_to("/", { :notice => "Diet deleted successfully."} )
  end

  def breakfast
    matching_diets = Diet.where(:user_id => @current_user.id)

    @list_of_diets = matching_diets.where({ :meal_name => "Breakfast" })

    render({ :template => "diets/breakfast.html.erb" })
  end


end

