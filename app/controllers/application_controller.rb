class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :resource_name, :resource, :devise_mapping, :resource_class

   
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:collectionist_name, :email, :password)}  
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:collectionist_name, :email, :password, :current_password)}
    end

    def resource_name
        :user
    end
    
    def resource
    @resource ||= User.new
    end
    
    def resource_class
        User
    end
    
    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end
end
