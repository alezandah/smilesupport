class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    dashboard_user_path
  end
  def after_update_path_for(resource)
    flash[:notice] = "Account succesfully updated"
    edit_user_registration_path
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :company_name)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :company_name)
  end

end

