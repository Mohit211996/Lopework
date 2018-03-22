Rails.application.routes.draw do
	
  
  resources :approvals
  resources :roles
	resources :technology
	resources :startup_technology
	resources :sign

  devise_for :users



 get '/client', to: 'client#index'
 get '/startup', to: 'startup#index' 

  root to:"homes#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 

end
