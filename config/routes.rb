Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy" 
  end
  
  root 'items#index'
  resources :cards, only: [:new, :index, :create, :destroy]
  resources :categories, only: [:index, :show]
  resources :users, only: [:index, :new, :show, :create] do
    member do
      get 'logout'
    end
  end

  namespace :items do
    resources :searches, only: :index
  end

  resources :items do
    resource :bookmarks, only:[:create, :destroy]
    resources :comments, only: [:create, :destroy]
    member do
      get 'buy'
      post 'pay'
    end
    collection  do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end
