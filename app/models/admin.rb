class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_admins
  has_many :rooms, through: :room_admins
  has_many :messages

  validates :name, presence: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |admin|
      admin.password = SecureRandom.alphanumeric
      admin.name = 'guestAdmin'
    end
  end
end
