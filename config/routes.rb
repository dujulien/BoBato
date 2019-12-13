Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'home#index'
  devise_for :users
  
  resources :user do
    resources :my_convoys, only: [:index, :show]
    resources :submissions, only: [:index]
  end

  resources :home, only: [:index]

  resources :convoys do
  	resources :pictures
  end

  resources :deliveries
  resources :charges
  resources :submissions, only: [:create, :destroy]

  resources :profiles do
    resources :avatars, only: [:create]
  end

  resources :comments

  # Custom error pages
  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unacceptable'
  get '/500', to: 'errors#server_errors'

end
