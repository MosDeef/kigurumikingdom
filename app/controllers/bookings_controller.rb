class BookingsController < ApplicationController
before_action :set_mascot, only: [:create]

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
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to mascot_path(@mascot)
    else
      render 'mascots/show', status: :unprocessable_entity

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