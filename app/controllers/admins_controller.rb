class AdminsController < ApplicationController
  before_action :ensure_admin!

  def index
    @cartitems = CartItem.group_by_day(:created_at).sum :quantity
    @total_user = User.count :id
    @total_product = Product.count :id
    @total_cart = Cart.count :id
    @topusers = Cart.load_top_user_cart
    @topsell = CartItem.load_top_sell
    @topproducts = Review.load_top_product
  end

  def filter_date
    date_arr = params[:daterange].split " - "
    @cartitems = CartItem.load_chart date_arr[0], date_arr[1]
  end

  def product_manager
    @q = Product.load_info.ransack params[:q]
    @q.sorts = %w(name price quantity) if @q.sorts.empty?
    @products = @q.result.page(params[:page]).per 6
    @product_chart = Product.joins(:category).group("categories.name")
  end

  def cart_manager

  end

  def user_manager

  end

  private

  def ensure_admin!

    if user_signed_in?
      return if current_user.admin?
      sign_out current_user
      redirect_to root_path
    end
  end
end
