class DietController < ApplicationController

  def show
    #@diet_items = Diet.where(:user_id => @current_user.id)
    render({ :template => "diet/show.html.erb" })
  end

end