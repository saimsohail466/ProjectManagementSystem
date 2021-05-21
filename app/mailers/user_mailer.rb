class UserMailer < ApplicationMailer
  def welcome_email(id)
    @user = User.find(id)
    @raw, @token = Devise.token_generator.generate(User, :reset_password_token)
    @user.reset_password_token = @token
    @user.reset_password_sent_at = Time.now.utc
    @user.save(validate: false)
    mail(to: @user.email, subject: "welcome to my site")
  end
end
