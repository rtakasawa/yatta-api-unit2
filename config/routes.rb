Rails.application.routes.draw do
  root 'materials#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :materials do
    collection do
      get 'book_search'
    end
  end
  resources :users, only: [:show]
end
