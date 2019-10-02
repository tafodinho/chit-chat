Rails.application.routes.draw do
  root 'microposts#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :microposts, :only => [:create, :new, :index]
end
