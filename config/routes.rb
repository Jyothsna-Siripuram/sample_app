# == Route Map
#

Rails.application.routes.default_url_options[:host] = "localhost:3000"

Rails.application.routes.draw do

  root "static_pages#home"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  get 'signout', to: 'sessions#destroy', via: :delete

  get 'help', to: 'static_pages#help'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'

end
