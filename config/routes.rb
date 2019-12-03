Rails.application.routes.draw do
  
  resources :submissions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  devise_for :skippers, path: 'skippers'
  devise_for :boat_owners, path: 'boat_owners'
  resources :convoys do
  	resources :pictures, only: [:create]
  end
  resources :skippers, only:[:show,:edit] do
  	resources :avatar_skipper
  end
  resources :boat_owner, only:[:show,:edit] do
  	resources :avatar_boat_owner
  end	
  resources :deliveries
  root 'demo#index'
  resources :demo, only: [:index]
  resources :charges


end
