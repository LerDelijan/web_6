Rails.application.routes.draw do
  root 'products#index'
  devise_for :users

  get 'products/index'
  post 'order_items/add'

  get 'orders/index'
  post 'orders/complete'
end
