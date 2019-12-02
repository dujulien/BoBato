Rails.application.routes.draw do
	devise_for :skippers, path: 'skippers'
	devise_for :boat_owners, path: 'boat_owners'
  resources :convoys
  resources :applications
  resources :deliveries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'demo#index'
  resources :demo, only: [:index]
end
