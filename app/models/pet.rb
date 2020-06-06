class Pet < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_hour, presence: true

end
