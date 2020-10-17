class MessagesController < ApplicationController
  before_action :set_room, only: :index
  before_action :move_root_no_user, only: :index


  def index
    @message = Message.new
    @user = User.find_by(id: @room.user_id)
    @messages = @room.messages.includes(:admin)
  end

  def create
    @message = Message.new(message_params)
    ActionCable.server.broadcast 'message_channel', content: @message if @message.save
  end

  private

  def message_params
    if user_signed_in?
      params.permit(:message, :room_id).merge(user_id: current_user.id)

    elsif admin_signed_in?
      params.permit(:message, :room_id).merge(admin_id: current_admin.id)
    end
  end

  def set_room
    @room = Room.find(params[:room_id]) 
  end

  def move_root_no_user
    if !admin_signed_in? && (current_user&.id != @room.user_id)
      redirect_to root_path
    end
  end

end
