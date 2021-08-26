class WateringsController < ApplicationController
  def create
    @plant = Plant.find(params[:plant_id])
    @watering = Watering.new
    authorize @watering
    @watering.plant = @plant
    @watering.save
    watering_eplant
    redirect_to user_path(current_user)
  end

  private

  def watering_eplant
    return if @plant.user.eplant.nil?

    @eplant = @plant.user.eplant
    @eplant.level += 10
  end
end
