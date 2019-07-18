class OrdersController < ApplicationController
  before_action :signed_in_user, only: [:index]
  def index
    @orders = Order.all
  end

  private

  def signed_in_user
    unless signed_in?
      flash[:danger] = "Please sign in."
      redirect_to sign_in_path
    end
  end
end
