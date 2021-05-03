class UsersController < ApplicationController
  before_action :authenticate_member!
  before_action :set_user, only: %i[ edit update destroy disable_user give_manager_rights ]

  def index
  	@users = User.all
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "User updated successfully.."
    else
      render "new"
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "user destroy successfully.."
  end

  def disable_user
  	if @user.enable? 
  		@user.disable!
    else
      @user.enable!  
  	end
    redirect_to users_path
  end

  def give_manager_rights
    if @user.manager!
      redirect_to users_path, notice: " User updated Successfully.."
    end
  end

  private 

  def set_user
  	@user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :contact, :address)
  end
end
