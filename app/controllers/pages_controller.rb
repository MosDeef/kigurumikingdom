class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @mascots = Mascot.all
    @toprated_mascots = @mascots.max_by(3) { |mascot| mascot.average_rating }
    @carousel_items = @mascots.each_slice(3)

  end
end
