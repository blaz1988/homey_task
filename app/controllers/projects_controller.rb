class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]
  before_action :authorize

  def index
    @projects = Project.all
  end

  def show
    @comments = @project.comments
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])
    ProjectServices::StatusChanger.call(@project, project_params[:status])
    flash[:notice] = 'Status was successfully changed.'
    redirect_to @project
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :status, :user_id)
  end
end