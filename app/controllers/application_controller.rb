class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def forbid_login_user
    flash[:notice] = "既にログインしてます。"
    redirect_to("/blogs")
  end
  
  def after_sign_in_path_for(resource) 
    blogs_path
  end
  
  
  def after_log_in_path_for(resource) 
    blogs_path
  end
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
