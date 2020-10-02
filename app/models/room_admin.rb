class RoomAdmin < ApplicationRecord

  belongs_to :room
  belongs_to :admin
end
