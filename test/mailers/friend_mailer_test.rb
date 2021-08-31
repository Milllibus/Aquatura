require 'test_helper'

class FriendMailerTest < ActionMailer::TestCase
  test "share_calendar" do
    mail = FriendMailer.share_calendar
    assert_equal "Share calendar", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
