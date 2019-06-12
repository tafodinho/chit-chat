Rails.application.routes.draw do
  get '/signup', to: 'users#new'

  resource :users
end
