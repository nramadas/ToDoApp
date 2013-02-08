class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.completed_task_count = 0

    if @user.save!
      build_cookie(@user)
      redirect_to user_path(@user)
    else
      flash.now[:notice] = @user.errors.full_messages.first
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks

    unless @user==current_user
      redirect_to login_path
    end
  end
end
