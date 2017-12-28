Rails.application.routes.draw do
  get 'products/show'

  root "static_pages#home"
  get "/signup", to: "users#new"
  get "/login", to: "login_sessions#new"
  post "/login", to: "login_sessions#create"
  delete "logout", to: "login_sessions#destroy"
  resources :users
  resources :products
end
