class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :dogs
  has_many :bookings
  has_one_attached :photo
  validates :bio, length: { maximum: 500 }
  validates :first_name, :last_name, length: { maximum: 20 }

  def alias_name
    if first_name.present? && last_name.present?
      "#{first_name} #{last_name}"
    else
      email
    end
  end

  def about_me
    if bio.present?
      bio
    else
      "Hello! I am #{alias_name}. These are my dogs. They love being taken on walks"
    end
  end
end
