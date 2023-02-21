class MascotsController < ApplicationController

  def index
    @mascots = policy_scope(Mascot)
  end

  def new
    @mascot = Mascot.new
  end

  def create
    @mascot = Mascot.new(mascot_params)
    if @mascot.save
      redirect_to mascot_path(@mascot)
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
    params.require(:mascot).permit(:name, :photo)
  end
end
