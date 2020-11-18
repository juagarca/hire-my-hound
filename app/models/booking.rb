class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  validates :location, :start, :end, :price, presence: true
end
