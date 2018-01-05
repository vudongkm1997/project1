module CartsHelper
  def cart_new
    if !session[:cart]
      @cart = Cart.new user_id: session[:user_id]
      @cart.save
      session[:cart]= @cart.id
    end
  end

  def delete_cart
    @cart = Cart.find_by id: session[:cart]
    if @cart
      @cart.destroy
    end
  end

  def delete_cart_session
    session.delete :cart
  end
end
