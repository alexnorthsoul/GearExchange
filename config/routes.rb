Rails.application.routes.draw do
  root 'home#index'

  match '/help',  to: 'home#help',  via: 'get'
  match '/about', to: 'home#about', via: 'get'

  # ----------------------------------------------
  #                   ADMIN
  # ----------------------------------------------
  namespace :admin do
    get '/', to: 'dashboard#index'
    # Categories
    resources :categories, except: %i(show)
  end
end
