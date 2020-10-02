class Room < ApplicationRecord

  has_many :room_admins
  has_many :admins, through: :room_admins
  belongs_to :users
  has_many :messages
end
