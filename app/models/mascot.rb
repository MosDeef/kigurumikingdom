class Mascot < ApplicationRecord
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :name, :location, presence: true
  validates :description, length: { minimum: 5 }
end
