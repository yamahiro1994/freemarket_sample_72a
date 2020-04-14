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
  resources :cards, only: [:new, :index, :create, :destroy]
  resources :users, only: [:new, :show, :create] do
    member do
      get 't_user_credit_detail'
      get 't_user_credit_link'
      get 'logout'
    end
  end
  resources :items do
    resource :bookmarks, only:[:create, :destroy]
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
