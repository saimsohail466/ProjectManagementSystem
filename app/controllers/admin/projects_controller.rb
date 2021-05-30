class Admin::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :new_members, :assign_members, :fetch_members]
  before_action :fetch_members, only: [:new_members]

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

  def new_members; end

  def assign_members
    members = params[:users][:user_ids]
    
    members.each do |user_id|
      @project.activeprojects.create(user_id: user_id)
    end
    redirect_to @project, notice: "#{members.length} Members assign to this project Successfully.."
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
    params.require(:project).permit(:title, :description, :start_date, :question, :deadline, :client_id)
  end

  def set_members
    params.require(:users).permit(:user_ids)
  end

  def fetch_members
    employees = User.where(type_of: 'employee')
    @users = []
    if @project.users.blank?
      @users = employees
    else
      project_users = @project.users
      @users = employees - project_users
    end
    @users
  end
end
