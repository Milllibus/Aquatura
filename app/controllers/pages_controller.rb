class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    redirect_to user_path(current_user.id) if user_signed_in?
    @navbar_visible = false
    @home_background = true
  end
end
