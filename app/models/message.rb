class Message < ApplicationRecord
  belongs_to :room
  belongs_to :admin, optional: true
  belongs_to :user, optional: true

  validates :message, presence: true
  validate :require_either_admin_or_user

  private
  def require_either_admin_or_user
    return if admin.present? ^ user.present?
    errors.add(:base, '管理者かユーザーのどちらか一方のメッセージを送信してください')
  end


end
