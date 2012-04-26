class UserMailer < ActionMailer::Base
  default from: "thanksforyourmoney@daughterofstoreengine.com"

  def welcome_email(user)
    @user = user
    @url  = "http://daughterofstoreengine.herokuapp.com/"
    mail(:to => user.email_address, :subject => "Welcome to DOSE!")
  end
end
