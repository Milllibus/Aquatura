class PlantsController < ApplicationController
  layout 'green_background', only: [:show]

  def index
    @plants = policy_scope(Plant).where(user_id: current_user)
  end
  # retouc/h regarding specie_id and code the view of it

  def create
    @plant = Plant.new(plant_params)
    authorize @plant
    @plant.user = current_user
    @plant.specie = Specie.find(params[:specie_id])
    if @plant.save
      redirect_to user_path(current_user)
    else
      redirect_to specie_path(@plant.specie)
    end
  end

  # rubocop:disable Metrics/MethodLength
  def show
    @plant = Plant.find(params[:id])
    @specie = @plant.specie
    @next_day = (@plant.dates_of_watering(30).first.to_date - Date.today).to_i
    authorize @plant
    i = 0
    @schedule = @plant.dates_of_watering(30).map do |date|
      i += 1
      {
        id: i,
        calendarId: '1',
        title: "<i class='fas fa-shower'></i>",
        category: 'allday',
        start: date,
        bgColor: '#FFAE03'
      }
    end
    @plant.waterings.each do |watering|
      i += 1
      @schedule << {
        id: i,
        calendarId: '1',
        title: "<i class='fas fa-tint'></i>",
        category: 'allday',
        start: watering.created_at,
        bgColor: '#09573D',
        color: 'white'
      }
    end
  end
  # rubocop:enable Metrics/MethodLength

  def destroy
    @plant = Plant.find(params[:id])
    authorize @plant
    @plant.destroy
    redirect_to plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:nickname, :exposure)
  end
end
