class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @current = current_user.orders.where(completed: false).last
    @completed_orders = current_user.orders.where(completed: true)
  end

  def complete
    id = params.permit(:order_id)[:order_id]
    order = current_user.orders.find(id)
    if !order.completed 
      order.completed = true
      order.save
    end
    redirect_to orders_index_path
  end
end
