class MessagesController < ApplicationController

  def index
  end

  def create
    message = current_chat.messages.create(message_params)
    ActionCable.server.broadcast 'messages',
      message: message.message,
      username: User.user_name(message.sender_id),
      id: message.id
    
    head :ok
  end

  private

  def message_params
    params[:sender_id] = current_user.id
    params.permit(:sender_id, :message)
  end
end
