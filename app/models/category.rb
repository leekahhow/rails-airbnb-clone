class Category < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_one_attached :photo
  validates :animal_type, presence: true

  def to_label
    "#{animal_type}"
  end
end
