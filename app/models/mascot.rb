class Mascot < ApplicationRecord
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  has_many :reviews
  belongs_to :user
  geocoded_by :location
  validates :name, :location, presence: true
  validates :description, length: { minimum: 5 }
  after_validation :geocode, if: :will_save_change_to_location?


  include PgSearch::Model
  pg_search_scope :search,
  against: [ :name, :location, :description, :price],
  using: {
    tsearch: { prefix: true }
  }

  def average_rating
    # ratings = self.reviews.map { |review| review.rating}
    # ratings.sum/ratings.count
    reviews.average(:rating)&.round(1)
  end

end
