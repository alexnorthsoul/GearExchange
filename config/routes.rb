Rails.application.routes.draw do
  # ----------------------------------------------
  #                   FRONT
  # ----------------------------------------------

  devise_for :users, controllers: { omniauth_callbacks: 'auth_callbacks' }
  root 'home#index'

  match '/help',  to: 'home#help',  via: 'get'
  match '/about', to: 'home#about', via: 'get'
end
