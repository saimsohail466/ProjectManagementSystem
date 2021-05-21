class Admin::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  def index
    @projects = Project.all    
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
  end

  def show; end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to admin_project_path(@project), notice: "Update Project Successfully.."
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to admin_projects, notice: "Project Successfully deleted.." 
    end
  end

  private

  def set_project
    begin
      @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to projects_path, alert: "No such project founded.."
    end
  end

  def authenticate_user
    redirect_to root_path, notice: "Access Denied" if user_signed_in? and current_user.admin?
  end

  def project_params
    params.require(:project).permit(:title, :description, :start_date, :deadline, :client_id)
  end
end
