class Booking < ApplicationRecord
  belongs_to :mascot
  belongs_to :user
  validates :date, presence: true
end
