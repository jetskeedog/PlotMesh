class RegistrationsController < Devise::RegistrationsController

  
  private

  def sign_up_params
    params.require(:user).permit(:username, :name, :location, :email, :password, :password_confirmation, :profilepic)
  end

  def account_update_params
    params.require(:user).permit(:username, :name, :location, :email, :password, :password_confirmation, :current_password, :profilepic)
  end

end
