class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def build_cookie(user)
    cookies[:user_id] = user.id
    user.session_token = SecureRandom.uuid
    cookies[:token] = user.session_token
  end

  def current_user
    if cookies[:user_id] && cookies[:token] && cookies[:user_id] != '' 
      user = User.find(cookies[:user_id])
      if user.session_token && user.session_token == cookies[:token]
        user
      else
        nil
      end
    else
      nil
    end
  end
end
