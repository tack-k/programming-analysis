class MessagesController < ApplicationController

  def index
    @users = User.all
    @messages = Message.all
    @message = Message.new
    @room = Room.find(params[:room_id])
  end

  def create
    @message = Message.new(message_params)
  end


  private
  def message_params
    params.require(:message).permit(:message, :admin_id, :user_id, :room_id)
  end
end
