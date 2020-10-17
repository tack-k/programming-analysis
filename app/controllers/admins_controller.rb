class AdminsController < ApplicationController

  before_action :move_sign_in_no_login, only: [:index, :edit]

  def index
    @admins = Admin.all
  end

  private
  def move_sign_in_no_login
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
  end

end
