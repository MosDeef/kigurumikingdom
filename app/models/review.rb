class Review < ApplicationRecord
  belongs_to :user
	belongs_to :mascot
  validates :comment, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 0..5 }
  validates :user, uniqueness: {scope: :mascot_id}
end
