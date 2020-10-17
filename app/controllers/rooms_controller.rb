class RoomsController < ApplicationController

  before_action :move_root_no_login, only: [:new, :login]
  
  def index
    @rooms = Room.includes(:messages).order("messages.created_at DESC") 
  end

  def new
    @room = Room.new
    @admins = Admin.all
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_messages_path(@room.id)
    else
      redirect_to new_room_path
    end
  end

  def login
    @room = Room.find_by(user_id: current_user.id)
    if @room == nil
      redirect_to new_room_path
    end
  end


private

def room_params
  params.require(:room).permit(admin_ids: []).merge(user_id: current_user.id)
end

def move_root_no_login
  unless user_signed_in?
    redirect_to root_path
  end
end

end