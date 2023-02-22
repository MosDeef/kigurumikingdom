class MascotsController < ApplicationController

  def index
    @mascots = policy_scope(Mascot).order(:name)
    @markers = @mascots.geocoded.map do |mascot|
      {
        lat: mascot.latitude,
        lng: mascot.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {mascot: mascot})
      }
    end
  end

  def new
    @mascot = Mascot.new
    authorize @mascot
  end

  def create
    @mascot = Mascot.new(mascot_params)
    @mascot.user = current_user
    authorize @mascot
    if @mascot.save
      redirect_to booking_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @mascot = Mascot.find(params[:id])
    @booking = Booking.new
    authorize @mascot
  end

  private

  def mascot_params
    params.require(:mascot).permit(:name, :description, :location, :price, :photo)
  end
end
