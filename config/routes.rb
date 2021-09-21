Rails.application.routes.draw do
  devise_for :users
  root to:'todos#index'
  resources :todos do
    collection do
      get 'search'
      get 'searchh'
      get 'mytodo'
    end
    resources :comments, only: :create
  end
end
