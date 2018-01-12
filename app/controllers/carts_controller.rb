class CartsController < ApplicationController
  def index

  end
  def show
    @cart_item = Cart.includes(:cart_items, :products)
      .find_by id: session[:cart]
  end

  def save_cart_session
    cart_item_session cart_item_params
    puts cart_item_params
    cart_session
  end

  def create
    @cart = Cart.create session[:cart]
    add_cart_id @cart.id
    @cart_items = CartItem.create session[:item]
    clear_cart_session
  end

  def update
    @cart_item = Cart.find_by id: session[:cart]

    if @cart_item.update_attributes status: 1
      flash[:success] = t "success_pay"
      redirect_to root_path
      delete_cart_session
      cart_new
    else
      redirect_to cart_path id: session[:cart]
    end
  end

  def destroy
    delete_cart
    delete_cart_session
    cart_new
    redirect_to root_path
  end

  private

  def cart_item_params
    params.require(:cart).permit :product_id, :quantity, :total_price
  end

end
