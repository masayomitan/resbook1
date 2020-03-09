class TopsController < ApplicationController

  
  def index
    @restaurant = Restaurant.search(params[:search])
    @restaurant = Restaurant.all.order("id DESC")
    @image = Image.all.order("id DESC")
  end

  def new
  end

  def create
  end

end
