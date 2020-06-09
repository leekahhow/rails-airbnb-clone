class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_many :reviews, as: :reviewable

  validates :start_date, presence: true
  validates :hours, presence: true

end
