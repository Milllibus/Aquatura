class PlantsController < ApplicationController
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
      redirect_to plant_path(@plant)
    else
      redirect_to specie_path(@plant.specie)
    end
  end

  def show
    @plant = Plant.find(params[:id])
    @specie = @plant.specie
    @next_day = (@plant.dates_of_watering(30).first - Date.today).to_i
    authorize @plant
  end

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
