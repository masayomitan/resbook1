class RestaurantsController < ApplicationController

  before_action :set_reataurant, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]

  def index
    @restaurant = Restaurant
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.images.new
    # @restaurant.holidays.new
    4.times { @restaurant.images.new }
    
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to other_restaurant_path(@restaurant), notice: "他の情報を入力してください！"
    else
      flash[:alert] = "Something went wrong..."
      render :new
    end
  end
  

  def show
    @review = Review.new
    @reviews = @restaurant.reviews.order(created_at: :desc)
  end

  def edit
    @images = Image.find(params[:id])
    4.times { @restaurant.images.new }
    
  end

  def update
    
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant), notice: "保存しました！"
    else
      flash[:alert] = "間違えてる？"
    end
      return :new
  end

  def destroy
    if user_signed_in? && @restaurant.user_id == current_user.id
      @restaurant.destroy
      redirect_to mypages_path, notice: "削除しました！"
    else
      redirect_to mypages_path
    end
  end



  private

  def set_reataurant
    @restaurant = Restaurant.find(params[:id])
  end


  def is_authorised
    redirect_to root_path, alert: "You don't have permission" unless current_user.id == @restaurant.user_id
  end

  def restaurant_params
    params.require(:restaurant).permit(:restaurant_name, :describe, :address, :tel, :average_price_lunch, :average_price_dinner, :genre_id,
      :cards, :parking, :all_you_can_eat, :all_you_can_drink, :tobacco, :free_wifi, :private_room, :party, :takeout,:holiday,
      images_attributes: [:image, :_destroy, :id])
      .merge(user_id: current_user.id)
  end

end