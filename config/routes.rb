Rails.application.routes.draw do
  # 管理者用のルーティング
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:show, :destroy]
  end

  # 一般ユーザー用のルーティング
  scope module: :public do
    devise_for :users, controllers: {
      sessions: 'public/sessions',
      registrations: 'public/registrations',
      passwords: 'public/passwords'
    }
    
    # 一般ユーザーのトップページや情報
    root to: 'homes#top'
    get 'homes/about', to: 'homes#about', as: :about

    # ユーザー関連のルーティング
    resources :users, only: [:index, :show, :update, :edit, :destroy] do
      get 'mypage', on: :collection
    end

    # 検索機能のルーティング
    get 'search', to: 'searches#index', as: 'search'

    # レシピに関連するルーティング
    resources :recipes, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
  end
end
