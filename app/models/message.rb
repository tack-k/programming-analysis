class Message < ApplicationRecord

  belongs_to :room
  belongs_to :admin
  belongs_to :user

  validates :message, presence: true
end
