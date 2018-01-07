class StaticPagesController < ApplicationController
  def home
    @products = Product.load_info.order(:name).page(params[:page])
      .per Settings.per_page
  end
end
