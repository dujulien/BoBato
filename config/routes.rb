Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	devise_for :skippers, path: 'skippers'
	devise_for :boat_owners, path: 'boat_owners'
  resources :convoys
  resources :applications
  resources :deliveries
  root 'demo#index'
  resources :demo, only: [:index]
  resources :charges

end
