class PlantsController < ApplicationController

  def index
    @plants = Plant.where(user_id: current_user)
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    if @plant.save
      redirect_to plant_path
    else
      redirect_to specie_path
    end
  end

  def show
  end

  def destroy
  end

  private

  def plant_params
    params.require(:plant).permit(:nickname, :exposure)
  end
end
