class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :region
  has_many :bookings

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :phone_number, presence: true, uniqueness: true
end
