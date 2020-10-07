Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'homes#top'
  get "search" => "posts#search"
  get "ranking" => "posts#ranking"
  get 'homes/top'
  get 'homes/about'
  resources :posts do
  	resource :likes, only: [:create, :destroy]
  	resources :comments, only: [:create, :destroy]
  end
  resources :users
  resources :relationships, only: [:create, :destroy]
end
