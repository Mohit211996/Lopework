Rails.application.routes.draw do
	
  
  
  resources :startup_statuses
  resources :installments
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
 get '/startup/job_offer', to: 'startup#job_offer', :as => :job_offer
 get '/bids', to: 'bids#index'
  post '/bids', to: 'bids#create'

 get '/bids/new', to: 'bids#new', :as => :new
  root to:"homes#index"
 


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 

end
