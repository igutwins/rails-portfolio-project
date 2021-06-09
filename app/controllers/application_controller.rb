class ApplicationController < ActionController::Base
    
    def authentication_required
        if !logged_in?
            redirect_to root_path
        end
    end

    def logged_in?
        !!current_user
    end 

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 
    helper_method :current_user

    def is_managing_director
        current_user.title == Title.where(role: "Managing Director").first
    end 
    helper_method :is_managing_director

end
