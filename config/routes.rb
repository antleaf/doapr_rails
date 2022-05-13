Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  passwordless_for :users, at: '/', as: :auth

  root 'home#index'
  get 'home', to: 'home#index'
  get 'about', to: 'about#index'
end
