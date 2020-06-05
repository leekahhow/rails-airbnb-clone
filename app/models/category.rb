class Category < ApplicationRecord
  has_many :pets, dependent: :destroy

  validates :animal_type, presence: true


  def to_label
    "#{animal_type}"
  end

end
