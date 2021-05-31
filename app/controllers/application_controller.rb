class ApplicationController < ActionController::Base
    
    def authentication_required
        if !logged_in?
            redirect_to root_path
        end
    end

    def logged_in?
        session[:user_id]
    end 
end
