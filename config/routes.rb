Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'materials#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :materials do
    collection do
      get "search"
      # get 'book_search'
      # get 'qiita_search'
    end
  end
  resources :users, only: [:show]
  resources :works
end
