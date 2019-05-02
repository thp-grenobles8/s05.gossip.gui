Rails.application.routes.draw do
  resources :gossips, only: [
    :index, :show, :new, :create, :edit, :update, :destroy
  ] do
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:show, :new, :create]
  resources :cities, only: [:show]
  resources :comments, only: [:create, :edit, :update, :destroy]
  resources :tags, only: [:create]

  resources :sessions, only: [:new, :create, :destroy]

  # ----------------------
  root 'gossips#index'


  # static ---------------
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'


  # get '/welcome', to: 'dynamic#welcome'
  # get '/welcome/:name', to: 'dynamic#welcome'
end
