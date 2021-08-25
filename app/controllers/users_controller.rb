class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @plants = current_user.plants
    @watering = Watering.new
  end
end
