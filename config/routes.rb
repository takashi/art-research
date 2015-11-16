Rails.application.routes.draw do
  root to: 'articles#index'
  resources :user_sessions
  resources :users
  resources :articles, only: [:index, :show]

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
