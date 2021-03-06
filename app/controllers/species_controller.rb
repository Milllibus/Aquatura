class SpeciesController < ApplicationController

  def show
    @specie = Specie.find(params[:id])
    @plant = Plant.new
    authorize @specie
    @green_background = true
  end

  def index
    @species = policy_scope(Specie).all

    if params[:query].present?
      @species = @species.where('name ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'species/list', locals: { species: @species }, formats: [:html] }
    end
  end
end
