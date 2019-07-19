Rails.application.routes.draw do
  root "orders#index"

  get "sign_up", to: 'users#new'
  get "sign_in", to: 'sessions#new'
  post "sign_in", to: 'sessions#create'
  post "users", to: 'users#create'

  resources :orders, only: [:index, :show]
end
