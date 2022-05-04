# Preview all emails at http://localhost:3000/rails/mailers/offer_notifier_mailer
class OfferNotifierMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/offer_notifier_mailer/send_completed_swap_email
  def send_completed_swap_email
    OfferNotifierMailer.send_completed_swap_email
  end

end
