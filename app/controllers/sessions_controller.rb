class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(env['omniauth.auth'])
    User.find_by_id(user.id).update_attributes(exists: true)
    ActionCable.server.broadcast 'sessions',
          id: user.id,
          create: true,
          name: user.name
    session[:user_id] = user.id
    redirect_to root_path    
  end

  def destroy
    current_user.update_attributes(exists: false)
    ActionCable.server.broadcast 'sessions',
          id: current_user.id,
          create: false
    session[:user_id] = nil
    redirect_to root_path
  end

  def failure
    redirect_to request.env['omniauth.origin']
  end
end
