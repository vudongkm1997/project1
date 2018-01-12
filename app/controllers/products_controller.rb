class ProductsController < ApplicationController
  def index
    @q = Product.load_info.ransack params[:q]
    @q.sorts = %w(name price updated_at) if @q.sorts.empty?
    @products = @q.result.page(params[:page]).per Settings.product_per_page
  end

  def show
    @product = Product.find_by id: params[:id]
    @cart = Cart.new
    return if @product
    flash[:danger] = t "no_product"
    redicrect_to products_url
  end
end
