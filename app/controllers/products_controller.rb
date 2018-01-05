class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :admin_user, only: [:index]

  def show
    @product = Product.find_by id: params[:id]
    @cart = Cart.new
    return if @product
    flash[:danger] = t "no_product"
    redirect_to products_url
  end

  def index
    @products = Product.all.page(params[:page]).per 10
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
    @product.destroy
    flash[:success] = t "success_delete"
    redirect_to products_url
  end

  private
  def product_params
    params.require(:product).permit :name, :description, :image, :quantity,
    :price, :status, :category_id
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t "please-login."
      redirect_to login_path
    end
  end

end
