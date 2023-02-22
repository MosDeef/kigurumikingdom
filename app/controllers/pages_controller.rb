class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @mascots = Mascot.all
    @carousel_items = @mascots.each_slice(3)
  end
end
