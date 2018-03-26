class UserMailer < ApplicationMailer
	default from: 'rtr.mohitsangwan@gmail.com'
 
  def sign_up(user)
    @user = user
    @url  = 'http://localhost3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to LOPE WORK')
  end



end
