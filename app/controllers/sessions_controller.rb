class SessionsController < Devise::SessionsController
  before_action :check_user, only: [:create]

  def new
    super
  end

  def create
    super
  end

  private

  def check_user
    @user = User.find_by(set_user)
    redirect_to user_session_path, alert: "Incorrect email or password" and return if @user.blank?

    if @user.enabled?
      @user  
    else
      redirect_to user_session_path, alert: "You are Disabled by adminstration.."
    end
  end

  def set_user
    params.require(:user).permit(:email)
  end
end
