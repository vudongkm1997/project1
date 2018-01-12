module CartsHelper
  def clear_cart_session
    session.delete :cart
    session[:item]=[]
    session.delete :product

  end

  def add_cart_id id
    if session[:item]
      session[:item].map { |i|
        i[:cart_id] = id
      }
    end
  end

  def cart_item_session params

    if !session[:item]
      session[:item] = [params]
    else
      item_exist = session[:item].any? {|i|
        i["product_id"] == params["product_id"]}

      if item_exist
        session[:item].map { |i|

          if i["product_id"] == params["product_id"]
            i["quantity"] = i["quantity"].to_i + params["quantity"].to_i
            i["total_price"] = i["total_price"].to_f + params["total_price"].to_f
            return
          end
        }
      else
        session[:item].push(params)
        puts 2
        return
      end
      session.delete(:item)
    end
  end

  def cart_session
    cart_price = session[:item].map {|h| h["total_price"].to_f}.sum
    session[:cart] = {cart_price: cart_price, user_id: current_user.id}
    # session.delete(:cart)
  end
end
