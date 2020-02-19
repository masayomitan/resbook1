class RestaurantsController < ApplicationController

  def index
    @restaurant = Restaurant.all
  end

  def new
  end

  def create
  end

  def show
    @pimages = @restaurant.iamges
  end


end
