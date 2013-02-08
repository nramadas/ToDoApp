class SessionsController < ApplicationController
  def new
    @session = User.new

    redirect_to user_path(current_user) if current_user
  end

  def create
    @user = User.find_by_email(params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      build_cookie(@user)
      redirect_to user_path(@user)
    else
      flash.now[:notice] = "Invalid Username / Password"
      @session = User.new(params[:user])
      render 'new'
    end
  end

  def destroy
    if current_user
      current_user.session_token = nil
      cookies[:user_id] = nil
      cookies[:token] = nil
    end

    redirect_to root_path
  end
end