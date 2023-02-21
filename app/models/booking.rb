class Booking < ApplicationRecord
  belongs_to :mascot
  belongs_to :user
  validates :mascot, uniqueness: { scope: :user }
end
