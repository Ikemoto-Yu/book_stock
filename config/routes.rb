Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'books#index'
  resources :books  do
    resources :orders , only: [:index, :create]
    collection do
      get 'search'
    end
    resources :comments , only: [:create]
    end
  resources :users , only: [:show]
end
