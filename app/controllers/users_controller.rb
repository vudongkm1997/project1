class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :load_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def show
    return if @user
    flash[:danger] = t "no_user"
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

  def edit
  end

  def update

    if @user.update_attributes user_params
      flash[:success] = t "success_update"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :phone, :address, :password,
      :password_confirmation
  end

  def logged_in_user
    return if logged_in?
    flash[:danger] = t "please_login"
    redirect_to login_path
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "no-user"
    redirect_to root_path
  end

end
