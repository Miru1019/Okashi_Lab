Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#about", as: 'about'

  resources :recipes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :update, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
