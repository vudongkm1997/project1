class LoginSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user && user.authenticate(params[:session][:password])
      flash[:success] = t "success_login"
      remember user
      log_in user
      cart_new
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_to root_url
    else
      flash[:danger] = t "invalid"
      render :new
    end
  end

  def destroy
    delete_cart
    log_out if logged_in?
    redirect_to root_url
  end
end
