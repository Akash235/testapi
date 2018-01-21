class UserMailer < ApplicationMailer
  default from: 'demo.qset@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'www.google.com'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
