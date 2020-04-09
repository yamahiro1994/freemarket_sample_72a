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
  # root 'items#t_user_credit_link'
  resources :cards, only: [:new, :index, :create, :destroy]

  resources :items do
    member do
      get 'buy'
      post 'pay'
    end
    collection  do
      # のちのちmember
      get 't_user_credit_detail'
      get 't_user_credit_link'
      get 't_user_logout'
      get 't_user_show'
    end
  end
end
