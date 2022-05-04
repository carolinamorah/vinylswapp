require 'test_helper'

class UserNotifierMailerTest < ActionMailer::TestCase
  test "send_signup_email" do
    mail = UserNotifierMailer.send_signup_email
    assert_equal "Send signup email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
