class Category < ApplicationRecord
  has_many :pets

  validates :animal_type, presence: true

end
