Rails.application.routes.draw do
  
  root 'items#index'
  resources :items do
    member do
      get 'buy'
    end
  end