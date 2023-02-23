class Owner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:owner, Booking])
    @bookings_per_user = @bookings.group_by(&:user)
  end
end
