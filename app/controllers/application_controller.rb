class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def build_cookie(user)
    cookies[:user_id] = user.id
    user.update_attributes(session_token: SecureRandom.uuid)
    cookies[:token] = user.session_token
  end

  def current_user
    return nil if cookies[:user_id].nil? || cookies[:user_id] == ''
    return nil if cookies[:token].nil? || cookies[:token] == ''
    user = User.find(cookies[:user_id])
    return user if user.session_token == cookies[:token]
    return nil
  end
end
