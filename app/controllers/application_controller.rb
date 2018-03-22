class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up,keys:[ :email, :password, :company_name, :experience,:role_id,:approval_id,:technology_ids=>[]]) 
        devise_parameter_sanitizer.permit(:account_update,keys:[ :email, :password,  :company_name, :experience,:role_id,:approval_id,:technology_ids=>[]]) 
        # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password, :image) }
    end


    

    def after_sign_in_path_for(resource)
      @email = params[:user][:email]
      @user=User.where(email: @email).first
      if @user.role_id == 1
      	startup_path
      else
      	client_path
      end

    end


end
