Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'avatars/create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'demo#index'
  resources :demo, only: [:index]
  resources :submissions


  resources :convoys do
  	resources :pictures, only: [:create]
  end
 	

  resources :users, only:[:show,:edit] do
  	resources :avatar_user
  end

  resources :deliveries
  resources :charges

end
