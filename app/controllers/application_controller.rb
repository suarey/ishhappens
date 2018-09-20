class ApplicationController < ActionController::Base
    
    private 
    def current_user 
        @current_user ||= User.find_by(id:session[:user_id]) if session[:user_id]
      
    end
    def logged_in? 
        !!current_user
    end 

    def authorize
        redirect_to login_path, alert: 'Not authorized - you must be logged in!' if current_user.nil?
      end

      helper_method :current_user, :logged_in?

end
