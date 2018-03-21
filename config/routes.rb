Rails.application.routes.draw do
	
  
  resources :approvals
  resources :roles
	resources :technology
	resources :startup_technology

  devise_for :users

 devise_scope :user do
  get 'client/register', to: 'user/registrations#new_client'

end


  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 

end
