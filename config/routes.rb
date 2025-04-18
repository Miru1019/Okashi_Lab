Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get "home/about" => "homes#about", as: 'about'
  get 'mypage', to: 'users#mypage', as: 'mypage'

  resources :recipes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :update, :edit, :mypage, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
