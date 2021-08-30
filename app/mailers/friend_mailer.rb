class FriendMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.friend_mailer.share_calendar.subject
  #
  def share_calendar
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
