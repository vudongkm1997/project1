class CartsController < ApplicationController
  def show
    @cart_item = Cart.includes(:cart_items, :products)
      .find_by id: session[:cart]
  end

  def create
    @cart_item = CartItem.find_by product_id: params[:cart][:product_id],
      cart_id: session[:cart]
    if !@cart_item
      @cart_item = CartItem.new cart_item_params
      @cart_item.save
    else
      item = @cart_item
      item.quantity = item.quantity + params[:cart][:quantity].to_i
      item.total_price = item.total_price + params[:cart][:total_price].to_f
      item.update_attributes quantity: item.quantity,
        total_price: item.total_price
    end
    cart = Cart.find_by id: session[:cart]
    cart.cart_price = cart.cart_price + @cart_item.total_price
    cart.update_attributes cart_price: cart.cart_price
    redirect_to root_path
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
    params.require(:cart).permit :product_id, :cart_id, :quantity, :total_price
  end

end
