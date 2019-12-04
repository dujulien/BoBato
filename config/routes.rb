Rails.application.routes.draw do
  
  resources :submissions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :convoys do
  	resources :pictures, only: [:create]
  end
 	
  resources :deliveries
  root 'demo#index'
  resources :demo, only: [:index]
  resources :charges


end
