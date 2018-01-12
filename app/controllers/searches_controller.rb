class SearchesController < ApplicationController
  def index
    @products = Product.search(params[:term]).order_by_name
  end
end
