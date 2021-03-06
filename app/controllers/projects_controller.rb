class ProjectsController < ApplicationController
  before_action :require_login, except: :index
  
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def show
    @project = Project.find(params[:id])
  end

   private
  def project_params
    params.require(:project).permit(:name, :description, :file, :start_at, :end_at, uploads_attributes: [:file])
  end
end
