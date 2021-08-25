class SpeciesController < ApplicationController

  def show
    @specie = Specie.find(params[:id])
    @plant = Plant.new
  end

  def index
    @species = Specie.all

    if params[:query].present?
      @species = @species.where('name ILIKE ?', "%#{params[:query]}%")
      respond_to do |format|
        format.html
        format.text { render partial: 'species/list', locals: { species: @specis }, formats: [:html] }
      end
    end
  end
end
