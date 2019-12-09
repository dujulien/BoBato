class ApplicationController < ActionController::Base
	before_action :store_user_location!, if: :storable_location?
	protect_from_forgery with: :exception

	before_action :configure_devise_parameters, if: :devise_controller?

	def configure_devise_parameters
	  devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation)}
	  devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:email, :password, :password_confirmation)}
	end


	private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

  def after_sign_in_path_for(resource)
	  stored_location_for(resource) || super
	end

end
