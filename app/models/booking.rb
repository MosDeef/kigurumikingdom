class Booking < ApplicationRecord
  belongs_to :mascot
  belongs_to :user
  validates :date, presence: true
  validate :check_future_date

  enum :status, { pending: 0, accepted: 1, declined: 3 }
  scope :past, -> { where('date < ?', Date.today) }
  scope :future, -> { where('date >= ?', Date.today) }

  def check_future_date
    if date && date < Date.today
      errors.add(:date, "can't book in the past, fren")
    end
  end

  # def display_duration
  #   #  (duration -
  # end
end
