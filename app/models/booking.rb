class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user


  validates :start_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

end
