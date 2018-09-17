Rails.application.routes.draw do

  root to: 'stories#index'

  resources :stories 

  resources :sessions
  resources :users, only: [:new, :create]
  get '/login', to: 'sessions#new'
  get '/signup' => 'users#new'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  
end
