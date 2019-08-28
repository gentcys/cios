class OrdersController < ApplicationController
  before_action :signed_in_user, only: [:index, :show]
  def index
    @orders = Order.all
    @items_statistics = Hash.new{0}

    @orders.each do |order|
      order.order_items.each do |order_item|
        @items_statistics[order_item.item.name] += order_item.count
      end
    end

    render :index, locals: { orders: @orders, items_statistics: @items_statistics }
  end

  def show
    @order = Order.find_by(id: params[:id])
    if (@order == nil) then
      flash[:alert] = "The order does not exist."
      redirect_to orders_path
    else
      @order_items = @order.order_items
    end
  end

  private

  def signed_in_user
    unless signed_in?
      flash[:alert] = "Please sign in."
      redirect_to sign_in_path
    end
  end
end
