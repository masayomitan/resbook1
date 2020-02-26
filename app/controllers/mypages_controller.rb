class MypagesController < ApplicationController

  before_action :set_reataurant, except: [:index, :new, :create]


  def index
    @restaurant = Restaurant.all
  end

  def show
    @restaurants = Restaurant.all
  end



  def set_reataurant
    @restaurants = Restaurant.find(params[:id])
  end
end