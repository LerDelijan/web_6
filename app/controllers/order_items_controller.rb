class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def add
    product_id = params.permit(:product_id)[:product_id]
    product = Product.find(product_id)
    order = current_user.orders.last
    if order.nil? || order.completed
      order = current_user.orders.new
    end
    item = order.order_items.where(product: product).first
    if item.nil?
      item = order.order_items.new
      item.product = product
      item.quantity = 1
    else
      item.quantity = item.quantity + 1
    end
    item.save
    redirect_to products_index_path
  end
end
