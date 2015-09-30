class ChatsController < ApplicationController
  def create
    Chat.create
    redirect_to root_path
  end
end
