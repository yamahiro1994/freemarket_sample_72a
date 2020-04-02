Rails.application.routes.draw do
  # root 'items#index'
  root 'items#show'
  resources :items do
    collection do
      get 'buy'
    end
  end
end
