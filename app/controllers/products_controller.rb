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

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "success_c"
      redirect_to products_url
    else
      render :new
    end
  end

  def edit
    @product = Product.find_by id: params[:id]
  end

  def new
    @product = Product.new
  end

  def update
    @product = Product.find_by id: params[:id]

    if @product.update_attributes product_params
      flash[:success] = t "success_update"
      redirect_to products_url
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit :name, :description, :image, :quantity,
    :price, :status, :category_id
  end
end
