class UserMailer < ApplicationMailer
  def signup
    @user = params[:user]
    @url = "http://example.com/login"
    mail(to: @user.email, subject: "Welcome to My Awesome Site.")
  end
end
