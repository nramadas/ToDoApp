class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def show

  end

  def create
    @task = current_user.tasks.new(params[:task])
    @task.tags << Tag.make_tag(params[:tag]) unless params[:tag].empty?

    if @task.save
      redirect_to user_path(current_user)
    else
      flash.now[:notice] = @task.errors.full_messages.first
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    begin
      @task.tags << Tag.make_tag(params[:tag]) unless params[:tag].empty?
    rescue ActiveRecord::RecordInvalid
      flash.now[:notice] = "Already tagged with #{params[:tag]}"
    end

    redirect_to user_path(current_user)
  end

  def destroy
    @task = Task.find(params[:id])
    current_user.tasks.delete(@task)
    redirect_to user_path(current_user)
  end
end
