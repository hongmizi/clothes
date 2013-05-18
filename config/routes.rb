Clothes::Application.routes.draw do

  root to: "home#index"
  
  get "cart", to:"cart#show"
  put "cart", to:"cart#add_line_item"
  delete "cart", to:"cart#remove_line_item"


  resources :products, only:[:show, :index]
  resources :listings, only:[:show]
  resources :orders
  resources :designs

  get "settings/profile", to:"profile#show"
  put "settings/update", to:"profile#update"
  devise_for :users

  get "designer", to:"designer#show", as:"designer"
  get "manufacturer", to:"manufacturer#show", as:"manufacturer"

  get "admin", to:"admin#show"
  namespace :admin do
    resources :orders
    resources :products do
      resources :listings, only: [:create, :update, :destroy]
    end
    resources :manufacturers
    resources :designers
    resources :users
  end
end
