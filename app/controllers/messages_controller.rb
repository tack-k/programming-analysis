class MessagesController < ApplicationController
  def index
    @users = User.all
    @message = Message.new
    @room = Room.find(params[:room_id])
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
end
