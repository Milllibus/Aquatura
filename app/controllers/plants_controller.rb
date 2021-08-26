class PlantsController < ApplicationController
  def index
    @plants = Plant.where(user_id: current_user)
  end
  # retouc/h regarding specie_id and code the view of it

  def create
    @plant = Plant.new(plant_params)
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
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:nickname, :exposure)
  end
end
