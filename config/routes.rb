Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post    '/posts/:id/update_rating', to: 'posts#update_rating' 

  
  resources :users
  resources :posts do
    resources :comments
    post  '/publish', to: 'posts#publish'
  end
  resources :account_activations, only: [:edit]
end