class MessagesController < ApplicationController


  def create
    if current_user
      if message = current_chat.messages.create(message_params)
        ActionCable.server.broadcast 'messages',
          message: message.message,
          username: User.user_name(message.sender_id),
          id: message.id
          head :ok  
      end
    else
      head :error
    end
  end

  private

  def message_params
    params[:sender_id] = current_user.id
    params.permit(:sender_id, :message)
  end
end
