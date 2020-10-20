class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :room, dependent: :destroy
  has_many :messages, dependent: :destroy
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :result

  with_options presence: true do
    validates :username
    validates :result
  end
end
