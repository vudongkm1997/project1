class AdminsController < ApplicationController
  before_action :ensure_admin!
  def index
  end

  private

  def ensure_admin!
    return if current_user.admin?
    sign_out current_user
    redirect_to root_path
  end
end
