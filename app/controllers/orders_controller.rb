class OrdersController < ApplicationController
  layout false
  layout 'application', :except => :index
  def index
    @orders = Order.all
    # render layout: false, content_type: 'application/liquid'
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end
end
