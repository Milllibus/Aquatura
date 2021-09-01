class EplantsController < ApplicationController
  def new
    @plant = Eplant.new
  end

  def create
    @eplant = Eplant.new(eplant_params)
    @eplant.user = current_user
    if @eplant.save
      redirect_to eplant_path(@eplant)
    else
      render :new
    end
  end

  def show
    @eplant = current_user.eplant
    authorize @eplant
  end

  private

  def eplant_params
    params.require(:eplant).permit(:nickname)
  end
end
