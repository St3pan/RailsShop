# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  private 

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :role, :email, :password)
    end

    def account_update_params
      #logger.debug "#{@user.inspect}"
      params.require(:user).permit(:first_name, :last_name, :role, :email, :password, :password_confirmation, :current_password)
    end
end
