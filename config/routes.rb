Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    collection do
      get 'buy'
    end
  end
end