Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  
  root 'items#new'
  # root 'items#show'
  # 商品詳細画面確認用
  resources :items do
    member do
      get 'buy'
    end
  end
end
