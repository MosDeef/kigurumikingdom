class MascotsController < ApplicationController

  def index
    @mascots = Mascot.order(:name)
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
      redirect_to mascot_path(@mascot)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @mascot = Mascot.find(params[:id])
    authorize @mascot
  end

  private

  def mascot_params
    params.require(:mascot).permit(:name, :photo)
  end
end
