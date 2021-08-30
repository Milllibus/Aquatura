class FriendMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.friend_mailer.share_calendar.subject
  #
  def share_calendar
    @greeting = "Hi"
    @friend = params[:mail]
    mail(to: @friend, subject: 'Could you water my plants?')
  end
end
