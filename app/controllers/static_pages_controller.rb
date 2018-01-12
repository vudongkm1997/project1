class StaticPagesController < ApplicationController
  def home
    @q = Product.ransack params[:q]
    @q.sorts = %w(name price updated_at) if @q.sorts.empty?
    @products = @q.result.page(params[:page]).per Settings.product_per_page
  end
end
