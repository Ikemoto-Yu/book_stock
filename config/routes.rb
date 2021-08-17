Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :books  do
    collection do
      get 'search'
    end
    resources :comments , only: [:create]
    end
  resources :users , only: [:show]
end
