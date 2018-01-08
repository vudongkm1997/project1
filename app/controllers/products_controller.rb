class ProductsController < ApplicationController
  def show
    @product = Product.find_by id: params[:id]
    @cart = Cart.new
    return if @product
    flash[:danger] = t "no_product"
    redicrect_to products_url
  end

end
