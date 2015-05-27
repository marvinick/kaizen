class RegistrationsController < Devise::RegistrationsController

  private
    def sign_up_params
      params.require(:user).permit(:name, :email, :password)
    end

    def account_update_params
      params.require(:user).permit(:name, :email, :password, :current_password)
    end
end