class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(
			:sign_up, 
			keys: [:firstname, :lastname, :contact, :status, :type_of, :street, :city, :country, :avatar]
		)
    devise_parameter_sanitizer.permit(
      :account_update, keys: [:firstname, :lastname, :contact, :status, :type_of, :street, :city, :country, :avatar]
    )
	end

  def validate_user
    if current_user.employee?
      redirect_to root_path, alert: "You are not able to access this page.."
    end
  end

  def user_signed?
    if !user_signed_in?
      redirect_to new_user_session_path, alert: "login to access this page.."
    end
  end
end
