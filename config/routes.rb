Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }
  
  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy" 
  end

  root 'items#index'
  resources :cards,  only: [:new, :create, :index, :destroy]
  resources :drafts, only: [:new, :index, :create]
  resources :users,  only: [:new, :create, :show] do
    member do
      get 't_user_credit_detail'
      get 't_user_credit_link'
      get 'logout'
    end
  end
  resources :items do
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

