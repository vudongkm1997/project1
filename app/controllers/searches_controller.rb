class SearchesController < ApplicationController
  def index
    @products = Product.search(params[:term]).order_by_name
    render json:@products.map {|p| p.name}
  end
end
