class StaticPagesController < ApplicationController
  def home
    @products = Product.info.order(:name).page(params[:page]).
      per Settings.product_per_page
  end
end
