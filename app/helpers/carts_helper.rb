module CartsHelper
  def cart_new
    return if session[:cart]
    @cart = Cart.new user_id: session[:user_id]
    @cart.save
    session[:cart]= @cart.id
  end

  def delete_cart
    @cart = Cart.find_by id: session[:cart]
    return if !@cart
    @cart.destroy
  end

  def delete_cart_session
    session.delete :cart
  end
end
