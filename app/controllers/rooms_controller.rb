class RoomsController < ApplicationController

  def new
    @user = current_user
    @room = @user.room
  end

  def create

  end

end
