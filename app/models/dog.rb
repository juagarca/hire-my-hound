class Dog < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  validates :name, :breed, presence: true
end
