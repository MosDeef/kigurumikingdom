class Owner::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:owner, Booking])
    @bookings_per_user = @bookings.group_by(&:user)
    start_date = params.fetch(:date, Date.today).to_date
    @booking = @bookings.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end
end
