# Preview all emails at http://localhost:3000/rails/mailers/user_notifier_mailer
class UserNotifierMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier_mailer/send_signup_email
  def send_signup_email
    UserNotifierMailer.send_signup_email
  end

end
