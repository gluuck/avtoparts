Rails.application.routes.draw do
  
  resources :executors
  resources :categories
  resources :orders do
    resources :services
  end
  resources :customers
  root 'orders#index'
end
