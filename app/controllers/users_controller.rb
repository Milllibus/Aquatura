class UsersController < ApplicationController
  # rubocop:disable Metrics/MethodLength
  def show
    @user = User.find(params[:id])
    @plants = current_user.plants
    @watering = Watering.new
    authorize @user
    i = 0
    @general_schedule = []
    @plants.each do |plant|
      plant.dates_of_watering(30).each do |date|
        i += 1
        plant_schedule = {
          id: i,
          calendarId: '2',
          title: plant.nickname,
          category: 'allday',
          start: date,
          bgColor: '#FFAE03'
        }
        @general_schedule << plant_schedule
      end
    end
  end
# rubocop:enable Metrics/MethodLength
end
