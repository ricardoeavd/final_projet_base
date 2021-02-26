class UsersController < ApplicationController

  def new_registration_form
    render({ :template => "users/new_registration_form.html" })
  end

  def create
    user = User.new
    user.username = params.fetch("input_username")
    user.password = params.fetch("input_password")
    user.password_confirmation = params.fetch("input_password_confirmation")
    save_status = user.save

    if 
      save_status == true
      session.store(:user_id, user.id)
      redirect_to("/user_diet_plan")      
    else
      redirect_to("/user_sign_up", {:alert => user.errors.full_messages.to_sentence})
    end
  end

  def sign_out
    reset_session
    redirect_to("/", {:notice => "You have signed out!"})
  end

  def sign_in
    render({ :template => "users/sign_in_form.html" })
  end

  def verify_credentials
    username = params.fetch("input_username")
    password = params.fetch("input_password")

    user = User.where({:username => un}).at(0)

    if user == nil
      redirect_to("/", {:alert => "Please sign in to access your diet plan!"})
    elsif
      user.authenticate(password)
      session.store(:user_id, user.id)
      redirect_to("/user_diet_plan",{:notice => "Welcome back to your diet plan!"})
    else
      redirect_to("/", {:alert => "Your username or password is incorret."})
    end
  end

end