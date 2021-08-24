class PlantsController < ApplicationController

  def index
    @plants = Plant.where(user_id: current_user)
  end
  # retouch regarding specie_id and code the view of it
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
    @plant = Plant.find(params[:id])
  end

  def destroy
  end

  private

  def plant_params
    params.require(:plant).permit(:nickname, :exposure)
  end
end
