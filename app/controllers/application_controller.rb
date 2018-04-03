class ApplicationController < ActionController::Base
	 include Devise::Controllers::Rememberable
  protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up,keys:[ :email, :password, :company_name, :experience,:role_id,:approval_id,:technology_ids=>[]]) 
        devise_parameter_sanitizer.permit(:account_update,keys:[ :email, :password,  :company_name, :experience,:role_id,:approval_id,:technology_ids=>[]]) 
        # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password, :image) }
    end

 # def after_sign_in_remember_me(resource)
 #    remember_me resource
 #  end 
 #  private
 #  def current_user
 #  	@current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
 #  end 
 #  helper_method :current_user
    

    



end
