Rails.application.routes.draw do
 get "/home" => "pages#home"
 
 root "pages#home"
end
