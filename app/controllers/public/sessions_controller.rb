# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
  end

  def after_sign_in_path_for(resource)
    mypage_users_path
  end

  def after_sign_out_path_for(resource_or_scope)
    about_path
  end
end
