Rails.application.routes.draw do
  get 'tags/create'
  resources :gossips, only: [
    :index, :show, :new, :create, :edit, :update, :destroy
  ]
  resources :users, only: [:show]
  resources :cities, only: [:show]
  resources :comments, only: [:create, :edit, :update, :destroy]
  resources :tags, only: [:create]

  # ----------------------
  root 'gossips#index'


  # static ---------------
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'


  # get '/welcome', to: 'dynamic#welcome'
  # get '/welcome/:name', to: 'dynamic#welcome'
end
