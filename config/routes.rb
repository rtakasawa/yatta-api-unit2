Rails.application.routes.draw do
  root 'materials#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :materials
  resources :users, only: [:show]
end
