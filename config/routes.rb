# frozen_string_literal: true

Rails.application.routes.draw do
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
  resources :product, only: %i[index show]
  resources :customers, only: %i[index show]
  resources :orders, only: %i[index show]
  resources :categories, only: %i[index show]

  root to: 'products#index' # root to products controller index action
end
