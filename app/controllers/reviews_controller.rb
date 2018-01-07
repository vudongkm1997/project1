class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      flash[:success] = "review created!"
      redirect_to product_path id: params[:review][:product_id]
    else
      redirect_to root_url
    end
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit :comment, :product_id, :user_email
  end
end
