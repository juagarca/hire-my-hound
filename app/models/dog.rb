class Dog < ApplicationRecord
  belongs_to :user

  validates :name, :breed, presence: true
end
