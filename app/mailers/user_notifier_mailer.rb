class UserNotifierMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier_mailer.send_signup_email.subject
  #
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Muchas gracias, por registrarte en VinylSwapp' )
  end
end
