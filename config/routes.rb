Rails.application.routes.draw do
	resources :technology
	resources :startup_technology
  	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
