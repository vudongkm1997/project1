class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def show
    @product = Product.find_by id: params[:id]
    @cart = Cart.new
    return if @product
    flash[:danger] = t "no_product"
    redirect_to products_url
  end

  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t "please-login."
      redirect_to login_path
    end
  end
end
