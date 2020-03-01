class TopsController < ApplicationController

  
  def index
    @review = Review.find_by(id: params[:id])
    @restaurant = Restaurant.all.order("id DESC").first(6)
    @image = Image.all.order("id DESC")
    @review = Review.new
    @reviews = @restaurant.reviews.order(created_at: :desc)
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
