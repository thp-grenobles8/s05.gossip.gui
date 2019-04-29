Rails.application.routes.draw do
  root 'static#home'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'

  get 'user/:id', to: 'show#user', as: 'show_user'
  get 'potin/:id', to: 'show#gossip', as: 'show_gossip'

  get '/welcome', to: 'dynamic#welcome'
  get '/welcome/:name', to: 'dynamic#welcome'
end
