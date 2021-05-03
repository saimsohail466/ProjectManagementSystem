class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(
			:sign_up, 
			keys: [:role_id, :firstname, :lastname, :address, :contact, :status, :type_of]
		)
    devise_parameter_sanitizer.permit(
      :account_update, keys: [:role_id, :firstname, :lastname, :address, :contact, :status, :type_of]
    )
	end
end
