Rails.application.routes.draw do
  root 'home#index'

  match '/help',  to: 'home#pricing', via: 'get'
  match '/about', to: 'home#pricing', via: 'get'
end
