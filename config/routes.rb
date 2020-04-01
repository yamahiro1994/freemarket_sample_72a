Rails.application.routes.draw do
  root 'items#buy'
  resources :items do
    member do
      get 'buy'
    end
  end
end
