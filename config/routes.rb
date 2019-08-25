Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :warehouses, only: [:edit, :update]
  resources :products, only: [:index, :new, :create]
  root 'products#index'
end
