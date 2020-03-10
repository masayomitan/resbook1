class RestaurantsController < ApplicationController

  before_action :set_reataurant, except: [:index, :new, :create, :search]
  before_action :authenticate_user!, except: [:show, :search]
    

  def new
    @restaurant = Restaurant.new
    @restaurant.images.new
    4.times { @restaurant.images.new }
    
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to other_restaurant_path(@restaurant), notice: "他の情報を入力してください！"
    else
      render :new
    end
  end
  

  def show
    @review = Review.new
    @reviews = @restaurant.reviews.order(created_at: :desc)
  end

  def edit
    if user_signed_in? && @restaurant.user_id == current_user.id
      @images = Image.find_by(params[:id])
      4.times { @restaurant.images.new }
    else
      redirect_to mypages_path
    end
      
  end

  def update

    new_params = restaurant_params
    
    if @restaurant.update(new_params)
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

  def search
    @restaurant = Restaurant.search(params[:restaurant_name]).order("id DESC")
  end

  private

  def set_reataurant
    @restaurant = Restaurant.find(params[:id])
  end


  def restaurant_params
    params.require(:restaurant).permit(:restaurant_name, :describe, :address, :tel, :average_price_lunch, :average_price_dinner, :genre_id,
      :cards, :parking, :all_you_can_eat, :all_you_can_drink, :tobacco, :free_wifi, :private_room, :party, :takeout,:holiday,
      images_attributes: [:image, :_destroy, :id])
      .merge(user_id: current_user.id)
  end

end