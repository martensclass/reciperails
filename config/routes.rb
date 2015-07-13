Rails.application.routes.draw do
 get "/home" => "pages#home"
 
 root "pages#home"
 
 #this gets the following
 #index / #show
 #edit / #update
 #new / #create
 #destroy
 
 resources :recipes do
 
  member do
    post "like"
    post "comment"
    patch "changevote"
  end
 
 end
 
 resources :comments, only: [:destroy]
 
 resources :chefs, except: [:new]
 
 get '/register', to: 'chefs#new'
 
 #login and logout
 
 get '/login', to: 'logins#new'
 post '/login', to: 'logins#create'
 get '/logout', to: 'logins#destroy'
 
 resources :styles, only: [:new, :create, :show]
 resources :ingredients, only: [:new, :create, :show]
end
