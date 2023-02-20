class MascotsController < ApplicationController

  def index
    @mascots = Mascot.order(:name)
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
  end

  private

  def mascot_params
    params.require(:mascot).permit(:effect)
  end
end
