class Booking < ApplicationRecord
  belongs_to :mascot
  belongs_to :user
end
