class TopsController < ApplicationController

  
  def index
    @restaurant = Restaurant.all.order("id DESC").first(6)
    @image = Image.all.order("id DESC")
  end

  def new
  end

  def create
  end

  def show
    @pimages = @restaurant.iamges
  end


end
