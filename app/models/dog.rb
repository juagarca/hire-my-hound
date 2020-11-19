class Dog < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, :breed, :hourly_rate, presence: true
  has_many :bookings
end
