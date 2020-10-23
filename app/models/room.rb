class Room < ApplicationRecord
  has_many :room_admins
  has_many :admins, through: :room_admins
  belongs_to :user, optional: true
  has_many :messages

  validates :user_id, uniqueness: true
end
