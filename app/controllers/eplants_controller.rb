class EplantsController < ApplicationController
  def show
    @eplant = current_user.eplant
  end
end
