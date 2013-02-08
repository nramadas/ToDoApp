class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @tasks = @tag.tasks if @tag
    
    if @tag && @tag.users.include?(current_user)
      render 'users/show'
    else
      redirect_to root_path
    end
  end
end