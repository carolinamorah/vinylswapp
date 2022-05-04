class OfferNotifierMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.offer_notifier_mailer.send_completed_swap_email.subject
  #
 
  def send_completed_swap_email(user)
    @user = user

    mail( :to => @user.email,
    :subject => 'Congratulations! You have completed a swap.' )
  end
end
