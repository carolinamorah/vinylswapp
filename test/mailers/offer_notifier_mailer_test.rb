require 'test_helper'

class OfferNotifierMailerTest < ActionMailer::TestCase
  test "send_completed_swap_email" do
    mail = OfferNotifierMailer.send_completed_swap_email
    assert_equal "Send completed swap email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
