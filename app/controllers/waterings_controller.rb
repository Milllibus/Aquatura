class WateringsController < ApplicationController
  def create
    @plant = Plant.find(params[:id])
    @watering = Watering.new
    @watering.plant = @plant
    @watering.save
    watering_eplant
  end

  private

  def watering_eplant
    return if @plant.user.eplant.nil?

    @eplant = @plant.user.eplant
    @eplant.level += 10
  end
end
