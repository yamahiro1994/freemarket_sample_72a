Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  
  root 'items#index'
  # root 'items#t_user_credit_link'

  # 商品詳細画面確認用
  resources :items do
    member do
      get 'buy'
      # のちのちmember
      get 't_user_credit_detail'
      get 't_user_credit_link'
      get 't_user_logout'
      get 't_user_show'
    end
  end
end
