class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @mascots = Mascot.all
    @toprated_mascots = @mascots.select('mascots.*, reviews.rating')
                                .joins(:reviews).order(rating: :desc).distinct.limit(3)
    @carousel_items = @mascots.each_slice(3)

  end
end
