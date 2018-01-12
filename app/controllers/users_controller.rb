class UsersController < ApplicationController
  ratyrate_rater
  def new
    @user = User.new
  end

  def show
    return if @user
    flash[:danger] = t "nouser"
    redirect_to signup_path
  end
end
