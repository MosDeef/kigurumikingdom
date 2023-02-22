class Booking < ApplicationRecord
  belongs_to :mascot
  belongs_to :user
  validates :date, presence: true
  validate :check_future_date

  def check_future_date
    if date && date < Date.today
      errors.add(:date, "can't book in the past, fren")
    end
  end
end
