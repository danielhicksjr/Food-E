Rails.application.routes.draw do

  root "users#index"
  resources :users
  resources :posts 
  
  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]
  
end
