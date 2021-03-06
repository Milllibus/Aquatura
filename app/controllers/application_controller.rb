class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :init_user_message, :init_style_variable
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :address])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :address])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end


  private

  def init_style_variable
    @navbar_visible = true
    @green_background = false
    @home_background = false
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def init_user_message
    @user_message = flash[:user_message] || nil
  end

end
