Rails.application.routes.draw do
  root to:'todos#index'
  devise_for :users
  resources :todos do
    collection do
      get 'search'
      get 'searchh'
      get 'mytodo'
    end
    resources :comments, only: :create
  end
  resources :users
end
