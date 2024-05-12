Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  resources :musicals do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :comments do
  end
  root 'musicals#index' 


end
