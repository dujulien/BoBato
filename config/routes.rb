Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users 
   resources :user do
    resources :my_convoys, only: [:index, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'demo#index'
  resources :demo, only: [:index]

  resources :convoys do
  	resources :pictures
  end

  resources :deliveries
  resources :charges
  resources :submissions, only: [:create, :destroy]

  resources :profiles do
    resources :avatars, only: [:create]
  end
end


