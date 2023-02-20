class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :mascots
  has_many :bookings
  validates :nickname, length: { minimum: 16 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
