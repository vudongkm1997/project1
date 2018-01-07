class SearchesController < ApplicationController
  def index
    @products = Product.search(params[:term]).order_by_name.limit(5)
    render json:@products.map {|p| p.name}
  end

  def show
    @products = Product.load_info.search(params[:term])
      .page(params[:page]).per Settings.product_per_page
  end

  def search_user
    @users = User.search(params[:name])
    render json:@users
  end
end
