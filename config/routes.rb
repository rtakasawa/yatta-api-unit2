Rails.application.routes.draw do
  root 'materials#index'
  devise_for :users
  resources :materials
  resources :users, only: [:show]
end
