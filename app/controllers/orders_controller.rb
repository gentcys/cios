class OrdersController < ApplicationController
  before_action :signed_in_user, only: [:index, :show]
  def index
    @orders = Order.all
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
