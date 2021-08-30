class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @plants = current_user.plants
    @watering = Watering.new
    authorize @user
  end

  def calendar
    authorize current_user
  end

  def share_calendar
    authorize current_user
    FriendMailer.with(mail: params[:mail]).share_calendar.deliver_now
    flash[:notice] = "Email sent to #{params[:mail]}"
    redirect_to calendar_path
  end
end
