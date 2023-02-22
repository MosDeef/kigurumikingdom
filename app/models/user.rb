class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :mascots, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :nickname, presence: true, length: { maximum: 16 }
  has_many :bookings_as_owner, through: :mascots, source: :bookings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
