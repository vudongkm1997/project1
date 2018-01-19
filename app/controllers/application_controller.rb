class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  include CartsHelper

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :address])
  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_in_path_for resource
    if current_user.admin?
      admins_url
    else
      root_path
    end
  end
end
