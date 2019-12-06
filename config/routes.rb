Rails.application.routes.draw do
 
  get 'profiles/create'
  get 'profiles/show'
  get 'profiles/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'demo#index'
  resources :demo, only: [:index]
  resources :submissions


  resources :convoys do
  	resources :pictures, only: [:create]
  end

  resources :deliveries
  resources :charges

  resources :profiles do
    resources :avatars, only: [:create]
  end

end
