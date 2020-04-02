Rails.application.routes.draw do
  # root 'items#index'
  root 'items#show'
  # 商品詳細画面確認用
  resources :items do
    collection do
      get 'buy'
    end
  end
end
