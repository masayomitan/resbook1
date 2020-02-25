class ReviewController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to   restaurant_path(@review.shop)
end
