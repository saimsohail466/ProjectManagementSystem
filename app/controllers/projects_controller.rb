class ProjectsController < ApplicationController

  before_action :find_project, only: %i[ show edit update destroy ]
  
  
  def index
    if current_user.admin?
      @projects = Project.all
    else
      @projects = current_user.projects
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.create(project_params)
    if @project.save
      redirect_to client_project_path(params[:client_id],@project), notice: "successfully created.."
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to client_project_path(params[:client_id],@project), notice: "update successfully.."
    else
      render "edit"
    end
  end

  def destroy
    if @project.destroy
      redirect_to client_path(@project.client_id), notice: "successfully deleted.."
    end
  end

  private

  def project_params
     params.require(:project).permit(:title,:description,:question,:start_date,:deadline,:client_id)
  end 

  def find_project
    @project = Project.find(params[:id])
  end

end
