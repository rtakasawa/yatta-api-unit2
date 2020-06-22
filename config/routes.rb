Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'other_pages#index'
  # root 'materials#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :materials do
    collection do
      get "search"
    end
  end
  resources :users, only: [:show]
  resources :works
end
