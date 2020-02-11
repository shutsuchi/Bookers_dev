Rails.application.routes.draw do
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy]
  resources :users, only: [:index, :show, :new, :edit, :create, :update]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'home#top'
  get 'home/about'

  match 'signup', to: 'users#new', via: 'get'
  match 'signin', to: 'sessions#new', via: 'get'
  match 'signout', to: 'sessions#destroy', via: 'delete'

  #get '/login', to: 'session#new'
  #post '/login', to: 'session#create'
  #delete '/login', to: 'session#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
