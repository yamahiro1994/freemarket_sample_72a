Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  
  # root 'items#index'
  # root 'items#t-user-credit-detail'
  root 'items#t-user-credit-link'
  # root 'items#t-user-logout'
  # root 'items#t-user-show'
  # 商品詳細画面確認用
  resources :items do
    collection do
      get 'buy'
    end
  end
end
