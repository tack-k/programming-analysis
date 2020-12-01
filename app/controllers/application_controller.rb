class ApplicationController < ActionController::Base
  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in_user
    require_to root_path, notice: 'ゲストユーザーとしてログインしました'
  end
end
