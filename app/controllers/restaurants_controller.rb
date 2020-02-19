class RestaurantsController < ApplicationController

  def index
    @restaurant = Restaurant.all
  end

  def new
  end

  def create
  end



end
