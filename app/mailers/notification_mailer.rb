class NotificationMailer < ApplicationMailer
  default from: "on83.koike.takumi@gmail.com"

  def send_mail_to_user(user)
    @user = user
    mail(
      subject: "プログラミング学習クーポンをお送りします",
      to: @user.email
    ) do |format|
      format.text
    end
  end
end
