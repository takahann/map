Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
  devise_for :users
  root to: 'homes#top'
  get "search" => "posts#search"
  get "ranking" => "posts#ranking"
  resources :posts do
  	resource :likes, only: [:create, :destroy]
  	resources :comments, only: [:create, :destroy]
  end
  resources :users
  resources :relationships, only: [:create, :destroy]
end
