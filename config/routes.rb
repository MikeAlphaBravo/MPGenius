Rails.application.routes.draw do
  resources :accounts
  # root to: "vehicles#index"
  root to: "homepage#index"

  resources :vehicles do
    resources :services
    resources :fill_ups
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
