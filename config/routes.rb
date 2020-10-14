Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'other_pages#index'

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

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # ゲストログイン用
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

end
