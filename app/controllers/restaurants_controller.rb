class RestaurantsController < ApplicationController

  before_action :set_reataurant, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]

  def index
    @restaurant = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.images.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to other_restaurant_path(@restaurant), notice: "Saved..."
    else
      flash[:alert] = "Something went wrong..."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update

    new_params = restaurant_params
    # new_params = restaurant_params.merge(active: true) if is_ready_room
    
    if @restaurant.update(new_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong..."
    end
    render :index
  end


  private

  def set_reataurant
    @restaurant = Restaurant.find(params[:id])
  end


  def is_authorised
    redirect_to root_path, alert: "You don't have permission" unless current_user.id == @restaurant.user_id
  end

  def is_ready_room
    !@restaurant.active && !@restaurant.time.blank? && !@restaurant.listing_other.blank?
  end

  def restaurant_params
    params.require(:restaurant).permit(:restaurant_name, :describe, :address, :tel, :average_price_lunch, :average_price_dinner, :genre, :horiday, :drink,
      :cards, :parking, :all_you_can_eat, :all_you_can_drink, :tobacco, :free_wifi, :private_room, :party, :takeout,
      images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end
end