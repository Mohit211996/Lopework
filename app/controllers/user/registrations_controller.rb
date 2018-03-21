# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

# def new_client 

#   # build_resource({})
#   # respond_with self.resource



#   # self.resource = resource_class.new(sign_in_params)
#   #   clean_up_passwords(resource)
#   #   respond_with(resource, serialize_options(resource))

#   # self.resource = resource_class.new(sign_in_params)

#   # self.resource = resource_class.new_with_session(hash, session)

# end


# before_action :sign_up_params

  def new_client
    build_resource
    yield resource if block_given?
    respond_with resource
  end


#   def sign_up_params
#     devise_parameter_sanitizer.permit(:sign_up) do |user|
#       user.permit( :email, :password, :company_name, :experience,startup_technologies_attributes: [:user_id,:technology_id])
#     end
#   end



  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
