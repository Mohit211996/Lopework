Rails.application.routes.draw do
	
  
  
  resources :startup_statuses

  resources :client_preferences
  resources :installments
  mount Ckeditor::Engine => '/ckeditor'
  resources :project_statuses
  resources :projects
  resources :approvals
  resources :roles
	resources :technology
	resources :startup_technology
	resources :sign
  resources :bids

  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }


get 'main', to: 'homes#front_page'
 get '/client', to: 'client#index'
 get '/startup', to: 'startup#index' 
 get '/startup/project_page', to: 'startup#project_page', :as => :project_page
 get '/startup/job_offer', to: 'startup#job_offer', :as => :job_offer
 get '/client/all_bids', to: 'client#all_bidding_page'
 get '/client/project', to: 'client#project_display_page'
 get '/client/project2', to: 'client#project_display_page_2'
 post '/startup/job_offer1', to: 'startup#request_method'
 get '/startup/under_bidding_page', to: 'startup#under_bidding_page'
 root to:"homes#index"
 


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 

end
