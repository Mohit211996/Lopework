Rails.application.routes.draw do
	
  
 
  resources :client_preferences
  resources :installments
  resources :bids
  mount Ckeditor::Engine => '/ckeditor'
  resources :project_statuses
  resources :projects
  resources :approvals
  resources :roles
	resources :technology
	resources :startup_technology
	resources :sign

  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }



 get '/client', to: 'client#index'
 get '/startup', to: 'startup#index' 
 get '/startup/project_page', to: 'startup#project_page', :as => :project_page
 get '/client/all_bids', to: 'client#all_bidding_page'
 get '/client/project', to: 'client#project_display_page'
 get '/client/project2', to: 'client#project_display_page_2'

  root to:"homes#index"
 


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 

end
