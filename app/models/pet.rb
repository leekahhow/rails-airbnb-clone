class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, as: :reviewable

  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_hour, presence: true

end
