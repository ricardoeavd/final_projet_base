Rails.application.routes.draw do
 
  # Routes for the Fooditem resource:

  # CREATE
  post("/insert_fooditem", { :controller => "fooditems", :action => "create" })
          
  # READ
  get("/fooditems", { :controller => "fooditems", :action => "index" })
  
  get("/fooditems/:path_id", { :controller => "fooditems", :action => "show" })
  
  # UPDATE
  
  post("/modify_fooditem/:path_id", { :controller => "fooditems", :action => "update" })
  
  # DELETE
  get("/delete_fooditem/:path_id", { :controller => "fooditems", :action => "destroy" })

  #------------------------------

  # Routes for the Diet resource:

  # CREATE
  post("/insert_diet_item", { :controller => "diets", :action => "create" })
  get("/insert_diet_item", { :controller => "diets", :action => "create" })
          
  # READ
  get("/", { :controller => "diets", :action => "index" })
  
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
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

 # Routes for the Meals:

  # READ
  get("/breakfast", { :controller => "diets", :action => "breakfast" })
  
  # DELETE
  get("/delete_diet/:path_id", { :controller => "diets", :action => "destroy" })

end
