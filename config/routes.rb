Rails.application.routes.draw do
  get 'musicals/:musical_id/likes' => 'likes#create'
  get 'musicals/:musical_id/likes/:id' => 'likes#destroy'
  devise_for :users
  resources :users, only: [:show]

  resources :musicals do
    resources :likes, only: [:create, :destroy]
    resources :comments
  

  end
  
  root 'musicals#index' 


end
