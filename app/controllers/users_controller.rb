class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @plants = current_user.plants
    @watering = Watering.new
    authorize @user
  end

  def calendar

  end
end
