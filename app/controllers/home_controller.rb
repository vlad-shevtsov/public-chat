class HomeController < ApplicationController
  def index
    if current_chat
      @messages = current_chat.messages
    end
  end

  def show
  end
end
