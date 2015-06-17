Rails.application.routes.draw do
 get "/home" => "pages#home"
 
 root "pages#home"
 
 resources :recipes
 #this gest the following
 #index 
 #show
 #edit
 #update
 #new
 #create
 #delete
 
end
