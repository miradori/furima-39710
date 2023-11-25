Rails.application.routes.draw do
  devise_for :users
  get 'furimas/index'

  root to: "items#index"
  resources :items do
    # resources :comments, only: :create
  end
end
