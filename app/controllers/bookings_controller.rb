class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dog = Dog.find(params[:dog_id])
    @booking.save!
    redirect_to user_path(current_user)
  end

  private

  def booking_params
    params.require(:booking).permit(:location, :start, :end, :price)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
