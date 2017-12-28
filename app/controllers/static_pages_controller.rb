class StaticPagesController < ApplicationController
  def home
    @products = Product.info.order(:name).page(params[:page]).
      per Settings.product_per_page
  end

  def create
    if !session[:cart]
      @cart = Cart.new user_id: current_user.id
      @cart.save
      session[:cart]=@cart.id
    end
  end
end
