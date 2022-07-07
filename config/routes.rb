Rails.application.routes.draw do
  get 'services/show'
  get 'services/new'
  get 'services/create'
  get 'services/edit'
  get 'services/update'
  get 'services/destroy'
  resources :categories
  resources :orders do
    resources :services
  end
  resources :customers
  root 'orders#index'
end
