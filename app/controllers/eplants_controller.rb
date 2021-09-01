class EplantsController < ApplicationController
  def create
    @eplant = Eplant.new(eplant_params)
    authorize @eplant
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
