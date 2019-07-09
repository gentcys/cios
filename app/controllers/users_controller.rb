class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    flash[:success] = 'Success'
    redirect_to root_path
  end
end
