class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to   restaurant_path(@review.restaurant), notice: "レビューしました！"
  end

  private
  def review_params
    params.require(:review).permit(:comment, :star, :restaurant_id).merge(user_id: current_user.id)
  end

 
end