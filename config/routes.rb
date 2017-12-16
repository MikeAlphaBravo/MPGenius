Rails.application.routes.draw do
  resources :accounts
  root to: "vehicles#index"

  resources :services
  resources :fill_ups
  resources :vehicles
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
