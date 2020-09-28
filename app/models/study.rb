class Study < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :analysis, shortcut: [:no, :question]

  with_options presence: true do
    validates :image
    validates :method
    validates :content
    validates :reason
    validates :price
  end
end
