Rails.application.routes.draw do
 
  # Routes for the Meal resource:

  # CREATE
  post("/insert_meal", { :controller => "meals", :action => "create" })
          
  # READ
  get("/meals", { :controller => "meals", :action => "index" })
  
  get("/meals/:path_id", { :controller => "meals", :action => "show" })
  
  # UPDATE
  
  post("/modify_meal/:path_id", { :controller => "meals", :action => "update" })
  
  # DELETE
  get("/delete_meal/:path_id", { :controller => "meals", :action => "destroy" })

  #------------------------------

  # Routes for the Fooditem resource:

  # CREATE
  post("/insert_fooditem", { :controller => "fooditems", :action => "create" })
          
  # READ
  get("/fooditems", { :controller => "fooditems", :action => "index" })
    
  # DELETE
  get("/delete_fooditem/:path_id", { :controller => "fooditems", :action => "destroy" })

  #------------------------------

  # Routes for the Diet resource:

  # CREATE
  post("/insert_diet_item", { :controller => "diets", :action => "create" })
  get("/insert_diet_item", { :controller => "diets", :action => "create" })
          
  # READ
  get("/my_diet", { :controller => "diets", :action => "index" })
  
  # DELETE
  get("/delete_diet/:path_id", { :controller => "diets", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/", { :controller => "user_authentication", :action => "sign_in_form" })
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

 # Other Routes:

  # READ SPEFICIC MEALS
  get("/breakfast", { :controller => "diets", :action => "breakfast" })
  get("/lunch", { :controller => "diets", :action => "lunch" })
  get("/dinner", { :controller => "diets", :action => "dinner" })
  

end
