Rails.application.routes.draw do
  # ----------------------------------------------
  #                   FRONT
  # ----------------------------------------------

  devise_for :users, controllers: { omniauth_callbacks: 'auth_callbacks' }
  root 'home#index'

  match '/help',  to: 'home#help',  via: 'get'
  match '/about', to: 'home#about', via: 'get'

  resources :posts do
    resources :comments, only: %i(create destroy)
  end

  # ----------------------------------------------
  #                   ADMIN
  # ----------------------------------------------
  namespace :admin do
    get '/', to: 'dashboard#index'
    # Categories
    resources :categories, except: %i(show)
  end
end
