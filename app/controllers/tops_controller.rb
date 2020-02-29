class TopsController < ApplicationController

  
  def index
    @restaurant = Restaurant.all.order("id DESC").first(6)
    @image = Image.all.order("id DESC")
    @review = Review.find_by(id: params[:id])
  end

  def new
  end

  def create
  end


end
