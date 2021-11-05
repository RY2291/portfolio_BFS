class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramerters, if: :devise_controller?
  
  def after_sign_up_path_for(resource)
    user_path(current_user)
  end
  
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
  
  def after_sign_out_path_for(resource)
    top_path
  end
  
  private
  
  def configure_permitted_paramerters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
