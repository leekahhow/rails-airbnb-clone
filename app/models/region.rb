class Region < ApplicationRecord
  has_many :users, dependent: :destroy

  include PgSearch::Model
  multisearchable against: :name

end
