class Mascot < ApplicationRecord
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  belongs_to :user
  geocoded_by :location
  validates :name, :location, presence: true
  validates :description, length: { minimum: 5 }
  after_validation :geocode, if: :will_save_change_to_location?

end
