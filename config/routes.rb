Rails.application.routes.draw do
  root "static_pages#home"
  get "/signup", to: "users#new"
  get "/login", to: "login_sessions#new"
  post "/login", to: "login_sessions#create"
  delete "logout", to: "login_sessions#destroy"
  get "/search", to: "searches#index"
  get "/searchresults", to: "searches#show"
  delete "destroy_current_cart/:id", to: "carts#destroy_current_cart"
  get "/searchuser", to: "searches#search_user"
  resources :users
  resources :products
  resources :static_pages
  resources :carts
  resources :reviews
end
