# == Route Map
#

Rails.application.routes.default_url_options[:host] = "localhost:3000"

Rails.application.routes.draw do

  get 'users/new'

  root "static_pages#home"

  get 'signup', to: 'users#new'

  get 'help', to: 'static_pages#help'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'

end
