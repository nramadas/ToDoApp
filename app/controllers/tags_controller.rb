class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])

    redirect_to login_path unless @tag.users.include?(current_user)
  end
end