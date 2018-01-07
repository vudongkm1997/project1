class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user, only: [:index, :edit, :update, :destroy]

  def show
    @product = Product.find_by id: params[:id]
    @comments = Review.load_comment.where(product_id: params[:id])
      .order(created_at: :desc).page(params[:page]).per Settings.per_page
    @review = current_user.reviews.build if logged_in?
    @cart = Cart.new
    return if @product
    flash[:danger] = t "no_product"
    redirect_to products_url
  end

  def index
    @products = Product.load_info.page(params[:page]).per Settings.product_per_page
  end

  def new
    @product = Product.new
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

  def update
    @product = Product.find_by id: params[:id]

    if @product.update_attributes product_params
      flash[:success] = t "success_update"
      redirect_to products_url
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find_by id: params[:id]

    if @product
      @product.destroy
      flash[:success] = t "success_delete"
      redirect_to products_url
    end
  end

  private

  def product_params
    params.require(:product).permit :name, :description, :image, :quantity,
    :price, :status, :category_id
  end

end
