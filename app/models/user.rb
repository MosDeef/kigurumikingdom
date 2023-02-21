class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :mascots, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :nickname, length: { maximum: 16 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
