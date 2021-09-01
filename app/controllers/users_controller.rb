class UsersController < ApplicationController
  layout 'green_background', only: [:calendar]

  # rubocop:disable Metrics/MethodLength
  def show
    @user = User.find(params[:id])
    @watering = Watering.new
    authorize @user
    general_schedule
  end

  def calendar
    authorize current_user
    general_schedule
  end

  def share_calendar
    authorize current_user
    FriendMailer.with(mail: params[:mail], duration: params[:duration], user: current_user).share_calendar.deliver_now
    flash[:notice] = "Email sent to #{params[:mail]}"
    redirect_to calendar_path
  end

  private

  def general_schedule
    i = 0
    @plants = current_user.plants
    @general_schedule = []
    @plants.each do |plant|
      plant.dates_of_watering(30).each do |date|
        i += 1
        plant_schedule = {
          id: i,
          calendarId: '2',
          title: plant.specie.name,
          body: "Please water #{plant.nickname.capitalize}, #{plant.specie.name}",
          category: 'allday',
          start: date,
          color: '#FFAE03',
          bgColor: 'white',
          borderColor: 'white'
        }
        @general_schedule << plant_schedule
      end
    end
  end
  # rubocop:enable Metrics/MethodLength
end
