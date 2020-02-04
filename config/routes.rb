Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/about'

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/login', to: 'session#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :edit, :update, :index]
end
