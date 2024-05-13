Rails.application.routes.draw do
  get 'musicals/:musical_id/likes' => 'likes#create'
  get 'musicals/:musical_id/likes/:id' => 'likes#destroy'
  devise_for :users
  resources :users, only: [:show]

  resources :musicals do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  

  end
  resources :comments do
  end
  resources :likes do
  end
  resources :users do
  end
  root 'musicals#index' 


end
