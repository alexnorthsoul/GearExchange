Rails.application.routes.draw do
  root 'home#index'

  match '/help',  to: 'home#help',  via: 'get'
  match '/about', to: 'home#about', via: 'get'
end
