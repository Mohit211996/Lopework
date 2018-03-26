class SessionsController < Devise::SessionsController

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