class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user


  validates :start_date, presence: true
  validates :end_date, presence: true, date: { after_or_equal_to: :start_date}
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :pet_id, presence: true

end
