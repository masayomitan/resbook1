class TopsController < ApplicationController

  
  def index
    @review = Review.find_by(id: params[:id])
    @restaurant = Restaurant.all.order("id DESC").first(6)
    @image = Image.all.order("id DESC")
  end

  def new
  end

  def create
  end


end
