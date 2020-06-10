class Category < ApplicationRecord
  has_many :pets, dependent: :destroy

  validates :animal_type, presence: true

  include PgSearch::Model
  multisearchable against: :animal_type

  def to_label
    "#{animal_type}"
  end

end
