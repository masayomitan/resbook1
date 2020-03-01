class TopsController < ApplicationController

  
  def index
    @restaurant = Restaurant.all.order("id DESC").first(6)
    @image = Image.all.order("id DESC")
    @review = Review.new
    @reviews = @restaurant.reviews
  end

  def new
  end

  def create
  end

  def show
    @review = Review.new
    @reviews = @restaurant.reviews.order(created_at: :desc)
  end


end
