class FriendMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.friend_mailer.share_calendar.subject
  #
  def share_calendar
    @greeting = "Hi"
    @friend = params[:mail]
    @duration = params[:duration]
    @plants = params[:user].plants
    @current_user = params[:user]
    mail(to: @friend, subject: 'Could you water my plants?')
  end
end
