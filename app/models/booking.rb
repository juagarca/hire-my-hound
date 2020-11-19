class Booking < ApplicationRecord
  before_save :default_values
  belongs_to :user
  belongs_to :dog
  validates :location, :start, :end, :price, presence: true
  def default_values
    self.confirmation = false if self.confirmation.nil?
  end
end
