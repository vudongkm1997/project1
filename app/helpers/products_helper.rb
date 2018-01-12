module ProductsHelper
  def product_session product
    if !session[:product]
      session[:product] = {"#{product.id}" => {quantity: product.quantity}}
    else
      if !session[:product]["#{product.id}"]
        session[:product]["#{product.id}"] = {quantity: product.quantity}
      end
      # session.delete(:product)
    end
  end
end
