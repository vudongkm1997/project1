class AdminsController < ApplicationController
  before_action :ensure_admin!

  def index
    @cartitems = CartItem.group(:created_at).sum :quantity
  end

  def filter_date
    a = params[:daterange].split " - "
    @cartitems = CartItem.load_chart a[0], a[1]
  end

  private

  def ensure_admin!
    return if current_user.admin?
    sign_out current_user
    redirect_to root_path
  end
end
