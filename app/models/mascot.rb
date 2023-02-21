class Mascot < ApplicationRecord
  has_one_attached :photo
  has_many :bookings
  belongs_to :user
  validates :name, :location, presence: true
  validates :description, length: { minimum: 20 }
end
