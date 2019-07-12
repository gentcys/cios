# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def signup
    @user = User.first
    UserMailer.with(user: @user).signup
  end
end
