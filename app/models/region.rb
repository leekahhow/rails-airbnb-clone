class Region < ApplicationRecord
  has_many :users, dependent: :destroy
end
