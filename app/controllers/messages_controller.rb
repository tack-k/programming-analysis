class MessagesController < ApplicationController

  def index
    @users = User.all
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:admin)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end


  private
  def message_params
    params.permit(:message, :admin_id, :user_id, :room_id).merge(user_id: current_user.id)
  end
end
