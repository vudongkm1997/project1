Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  get "/signup", to: "users#new"
  get "/login", to: "login_sessions#new"
  post "/login", to: "login_sessions#create"
  delete "logout", to: "login_sessions#destroy"
  get "/search", to: "searches#index"
  resources :users
  resources :products
  resources :static_pages
  resources :carts
  resources :admins
end
