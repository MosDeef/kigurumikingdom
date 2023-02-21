class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @mascot = Mascot.find(params[:mascot_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.mascot = @mascot
    if @booking.save
      redirect_to mascot_bookings_path(@mascot)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_mascot
    @mascot = Mascot.find(params[:mascot_id])
  end

  def booking_params
    params.require(:booking).permit(:date, :mascot_id, :user_id)
  end
end
