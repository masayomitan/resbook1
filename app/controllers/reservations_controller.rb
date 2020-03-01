class ReservationsController < ApplicationController
  
  before_action :authenticate_user!

  def new
    @reservation = Reservations.new
  end


  def create
    @reservation = current_user.reservations.create(reservation_params)
     redirect_to root_path notice:"予約が完了しました"
  end

  def your_reservations
    @restaurants = current_user.restaurants
  end

  private
    def reservation_params
      params.require(:reservation).permit(:date, :time, :restaurant_id).merge(user_id: current_user.id)
    end

 end