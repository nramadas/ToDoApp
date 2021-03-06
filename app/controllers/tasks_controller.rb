class TasksController < ApplicationController
  def new
    redirect_to root_path unless current_user

    @task = Task.new
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
    redirect_to root_path unless current_user

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
    if current_user
      @task = Task.find(params[:id])
      current_user.tasks.delete(@task)
      task_count = current_user.completed_task_count + 1
      current_user.update_attributes(completed_task_count: task_count)

      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end
end
