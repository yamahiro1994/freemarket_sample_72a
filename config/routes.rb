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
  # root 'items#show'
  # 商品詳細画面確認用
  resources :items do
    collection do
      get 'buy'
    end
  end
end
