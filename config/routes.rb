Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :users, only: [:edit, :update, :show]
  resources :prototypes, only: [:index, :new, :create, :show, :edit, :destroy, :update] do
    resources :comments, only: :create
  end
end

