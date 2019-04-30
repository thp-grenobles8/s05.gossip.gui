Rails.application.routes.draw do
  resources :gossips, only: [:index, :show, :new, :create]

  # ----------------------
  root 'gossips#index'

  get 'user/:id', to: 'show#user', as: 'show_user'
  # get 'potin/:id', to: 'show#gossip', as: 'show_gossip'

  # static ---------------
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'


  # get '/welcome', to: 'dynamic#welcome'
  # get '/welcome/:name', to: 'dynamic#welcome'
end
