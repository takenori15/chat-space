Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :users
  resources :groups, only: [:new, :edit, :update, :create, :index] do
    resources :message, only: [:index, :create]
  end
end
