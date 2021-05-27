class TimelogsController < ApplicationController
  before_action :set_timelog, only: [:show, :edit, :update, :destroy]

  def new
    @timelog = Timelog.new
  end

  def create
    @timelog = Timelog.new(timelog_params)
    @timelog.save
  end

  def show; end

  def edit; end

  def update
    @timelog.update(timelog_params)
  end

  def destroy
    @timelog.destroy
  end

  private

  def set_timelog
    begin
      @timelog = Timelog.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "No such timelog founded.."
    end
  end

  def timelog_params
    params.require(:timelog).permit(:task_name, :working_hours, :task_description, :date_of_log, :project_id, :user_id)
  end
end
