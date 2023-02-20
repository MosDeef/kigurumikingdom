class Mascot < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  validates :name, :location, presence: true
  validates :description, length: { minimum: 20 }
end
