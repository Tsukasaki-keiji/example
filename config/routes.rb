Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'
  get '/home/about', to: 'homes#about'

  resources :blogs do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :videos, only: [:new, :create, :show, :index]

  resources :users, only: [:index, :show, :update, :edit, :new]

end
