class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include LoginSessionsHelper
  include CartsHelper
  include UsersHelper
  def logged_in_user
    return if logged_in?
    flash[:danger] = t "please-login."
    redirect_to login_path
  end
end
