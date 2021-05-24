class UsersController < ApplicationController
  before_action :user_signed?
  before_action :validate_user, only: [:edit, :update, :destroy]
  before_action :set_user, only: %i[ show edit update destroy change_user_status give_manager_rights ]

  def index
  	@users = User.all
  end

  def show; end

  # def edit; end

  # # def update
  # #   if @user.update(user_params)
  # #     redirect_to users_path, notice: "User updated successfully.."
  # #   else
  # #     render "new"
  # #   end
  # # end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "User destroy successfully.."
  end

  private 

  def set_user
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "Record not Found against users/" + params[:id].to_s
      return
    end
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :contact, :street, :city, :country)
  end

  def authenticate_user
    redirect_to root_path, alert: "Access Denied" if current_user.employee?
  end
end
