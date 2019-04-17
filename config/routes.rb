# frozen_string_literal: true

Rails.application.routes.draw do
  get 'order_products/create'
  get 'order_products/update'
  get 'order_products/destroy'
  get 'carts/show'
  resources :pages
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get 'orders/index'
  # get 'orders/show'
  # get 'customers/index'
  # get 'customers/show'
  # get 'categories/index'
  # get 'categories/show'
  # get 'products/index'
  # get 'products/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # create the index and show restful routes
  resources :products, only: %i[index show]
  resources :customers, only: %i[index show]
  resources :orders, only: %i[index show]
  resources :categories, only: %i[index show]

  resource :cart, only: [:show]
  resources :order_products, only: %i[create update destroy]

  get 'search_results', to: 'search#results', as: 'search_results' # route for seach results
  get 'static/:permalink', to: 'pages#static', as: 'static'
  root to: 'products#index' # root to products controller index action
end
