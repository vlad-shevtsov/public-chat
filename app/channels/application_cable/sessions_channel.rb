class SessionsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'sessions'
  end
end
