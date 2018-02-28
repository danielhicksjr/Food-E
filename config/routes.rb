Rails.application.routes.draw do

  root "posts#index"
  resources :users 
  resources :posts 
  
  delete '/logout' => 'sessions#destroy', as: :logout
  resources :sessions, only: [:new, :create]
  
end
