Rails.application.routes.draw do
  root "orders#index"

  get "sign_up", to: 'users#new'
  post "users", to: 'users#create'
end
