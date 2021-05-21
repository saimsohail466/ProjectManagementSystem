class ProjectsController < ApplicationController
  before_action :user_signed?
  before_action :validate_user, only: [:edit, :update, :destroy]
  before_action :find_project, only: %i[ show edit update destroy new_members ]
  
  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      Activeproject.create(user_id: current_user.id, project_id: @project.id)
      redirect_to client_project_path(params[:client_id],@project), notice: "successfully created.."
    else
      render "new"
    end
  end

  def show; end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to client_project_path(@project.client_id,@project), notice: "update successfully.."
    else
      render "edit"
    end
  end

  def new_members; end

  def create_members; end

  def destroy
    if @project.destroy
      redirect_to client_path(@project.client_id), notice: "successfully deleted.."
    end
  end

  private

  def project_params
     params.require(:project).permit(:title, :description, :question, :start_date, :deadline, :client_id)
  end 

  def find_project
    begin
      @project = Project.find(params[:id])      
    rescue ActiveRecord::RecordNotFound
      redirect_to projects_path, alert: "No such project founded.."
    end
  end
end
