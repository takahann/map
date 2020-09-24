Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#new'
  resources :posts do
  	resource :likes, only: [:create, :destroy]
  end
  resources :users
end
