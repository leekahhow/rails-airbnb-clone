class Pet < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, source: :reviews
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_hour, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: :name, #what to search
    using: {
      tsearch: { prefix: true }
    }

  include PgSearch::Model
    multisearchable against: :name

end
