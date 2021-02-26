Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'
  get '/home/about', to: 'homes#about'

  resources :blogs
  resources :videos, only: [:new, :create, :show]

end
