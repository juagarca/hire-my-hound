class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :dogs
  validates :bio, length: { maximum: 500 }
  validates :first_name, :last_name, length: { maximum: 20 }
end
