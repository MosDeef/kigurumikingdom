class BookingsController < ApplicationController
before_action :set_mascot, only: [:create]

  def index
    @bookings = policy_scope(Booking).joins(:mascot)
    @bookings_per_mascot = @bookings.group_by(&:mascot)
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
      flash[:notice] = "Booked for #{@booking.date}"
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
