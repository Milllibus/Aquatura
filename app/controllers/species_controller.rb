class SpeciesController < ApplicationController

  def show
    @specie = Specie.find(params[:id])
  end

  def index
    @species = Specie.all
  end
end
