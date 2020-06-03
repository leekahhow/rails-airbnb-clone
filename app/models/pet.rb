class Pet < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_hour, presence: true
  validates :user_id, presence: true
  validates :categories_id, presence: true

end
