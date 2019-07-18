class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.with(user: @user).signup.deliver_later

      sign_in(@user)

      flash[:notice] = "Success"
      redirect_to root_path
    else
      flash[:alert] = "Failed"
      redirect_to sign_up_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
