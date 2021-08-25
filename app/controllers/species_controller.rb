class SpeciesController < ApplicationController

  def show
    @specie = Specie.find(params[:id])
    @plant = Plant.new
  end

  def index
    @species = Specie.all
  end
end
