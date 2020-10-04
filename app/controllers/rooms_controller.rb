class RoomsController < ApplicationController

  def new
    @users = User.all
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to "/rooms/#{@room.id}/messages"
    else
      render :new
    end
  end

  private

  def room_params
    params.require(:room).permit(:user_id)
  end

end
