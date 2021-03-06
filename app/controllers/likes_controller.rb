class LikesController < ApplicationController
  def index
    @user = current_user
    @projects = Project.all
  end

  def create
    project = Project.find(params[:project_id])
    Like.create(:project => project, :user => current_user)
    redirect_to project_path(project), :notice => "" 
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

  def destroy
    project = Project.find(params[:project_id])
    like = Like.find(params[:id])
    like.destroy
    redirect_to project_path(project), :notice => ""
  end
end