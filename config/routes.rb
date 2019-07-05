Rails.application.routes.draw do
  get "sign_up", to: 'users#new'
end
