class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "nouser"
    redirect_to signup_path
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "success_signup"
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :phone, :address, :password,
      :password_confirmation
  end
end
