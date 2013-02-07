class SessionsController < ApplicationController
  def new
    @session = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      build_cookie(@user)
      redirect_to user_path(@user)
    else
      flash.now[:notice] = "Invalid Username/Password"
      @session = @user
      render 'new'
    end
  end

  def destroy
    curren_user.session_token = nil
    cookies[:user_id] = nil
    cookies[:token] = nil
  end
end