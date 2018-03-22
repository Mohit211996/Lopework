class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
  	if User.last.role_id == 1
  		startup_path
  	else
    client_path
	end
  end
  def after_update_path_for(resource)
   		
   		if current_user.role_id == 1
   			startup_path
   		else
   			client_path
   		end

   end
   
end