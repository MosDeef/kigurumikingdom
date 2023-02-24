class BookingsController < ApplicationController
before_action :set_mascot, only: [:create]

  def index
    @bookings = policy_scope(Booking).future.joins(:mascot)
    @bookings_per_mascot = @bookings.group_by(&:mascot)
    @past_bookings = policy_scope(Booking).past

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
      redirect_to bookings_path
    else
      @review = Review.new
      render 'mascots/show', status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to owner_bookings_path
    else
      #TODO ficx this
      render 'mascots/show', status: :unprocessable_entity
    end
  end

  private

  def set_mascot
    @mascot = Mascot.find(params[:mascot_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :date, :duration, :mascot_id, :user_id)
  end
end
