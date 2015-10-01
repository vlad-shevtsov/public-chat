class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    broadcast(user)
    session[:user_id] = user.id
    redirect_to root_path    
  end

  def destroy
    current_user.update_attributes(exists: false)
    broadcast(current_user)
    session[:user_id] = nil
    redirect_to root_path
  end

  def failure
    redirect_to request.env['omniauth.origin']
  end

  private 

  def broadcast(user)
    ActionCable.server.broadcast 'sessions',
          id: user.id,
          create: user.exists,
          name: user.name
  end
end
