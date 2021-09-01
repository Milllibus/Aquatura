class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :init_user_message
  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def init_user_message
    @user_message = flash[:user_message] || nil
  end
end
