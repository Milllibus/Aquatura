class EplantsController < ApplicationController
  def show
    @eplant = current_user.eplant
    authorize @eplant
  end
end
