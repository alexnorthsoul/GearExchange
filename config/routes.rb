Rails.application.routes.draw do
  # ----------------------------------------------
  #                   FRONT
  # ----------------------------------------------

  root 'home#index'

  devise_for :users, controllers: { omniauth_callbacks: 'auth_callbacks' }

  match '/help',  to: 'home#help',  via: 'get'
  match '/about', to: 'home#about', via: 'get'

  resources :posts do
    resources :comments, only: %i(create destroy)
    put :vote_up, :vote_down, on: :member

    resources :comments, only: %i(create destroy) do
    end
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
