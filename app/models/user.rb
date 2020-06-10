class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :region
  has_many :bookings
  # has_many :reviews, through: :bookings, source: :reviews

  has_many :pets
  has_many :reviews, as: :reviewable, source: :reviews

  validates :email, uniqueness: true
  validates :name, presence: true
  validates :phone_number, presence: true
  # by format
end
