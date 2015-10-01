class ChatsController < ApplicationController
  def create
    if chat = Chat.create
      redirect_to root_path
    end
  end
end
