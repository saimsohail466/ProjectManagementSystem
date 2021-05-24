class Admin::UsersController < ApplicationController
  before_action :authenticate_login, :authenticate_user
  before_action :set_user, only: [:change_user_status, :give_manager_rights, :show, :edit, :update]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    # UserMailer.welcome_email(@user.id).deliver_now if @user.save
  end

  def show; end

  def change_user_status
    @user.toggle!(:enabled)
    redirect_to admin_users_path, notice: "User updated successfully.."
  end

  #assign_manager_permission
  def give_manager_rights
    if @user.manager!
      redirect_to admin_users_path, notice: " User updated Successfully.."
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      # sign_in :user, @user, bypass: true
      redirect_to admin_users_path, notice: "User update Successfully.."
    else
      render :edit
    end
  end

  private 

  def authenticate_user
    redirect_to root_path, alert: "Access Denied" if !current_user.admin?
  end

  def authenticate_login
    redirect_to root_path, alert: "Login first.." if !user_signed_in?
  end

  def set_user
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to admin_users_path, alert: "No such user found.."
    end
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :contact, :street, :city, :country, :password, :avatar)
  end
end
