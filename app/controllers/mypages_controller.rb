class MypagesController < ApplicationController

  before_action :set_reataurant, except: [:index, :new, :create]
  before_action :authenticate_user!

  def index
    
    @restaurant = Restaurant.all.where(user_id: current_user.id)
  end

  def show
    
    @restaurants = Restaurant.all
  end



  def set_reataurant
    @restaurants = Restaurant.find(params[:id])
  end
end