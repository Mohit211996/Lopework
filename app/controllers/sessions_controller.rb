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
    # def new
    #   @user = user.new
    # end
    # def before_sign_in_path_for(resource)
    # end
  #   def remember_me
  #   true
  # end
  # def create
  # 	user = User.find_by_email(params[:email])
  # 	if user && user.authenticate(params[:password])
  # 		if params[:remember_me]
  # 		cookies.permanent[:auth_token] = user.auth_token
  # 	else
  # 		cookies[:auth_token] = user.auth_token
  # 	end
  # 		redirect_to root_url, :notice => "Logged in"
  # 	else 
  # 		flash.now.alert = "invalid email or password"
  # 		render "new"
  # 	end
  # end
  # def destroy
  # 	cookies.delete(:auth_token)
  # 	redirect_to root_url, :notice => "logged out"
  # end

end