class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create


    def new
    end

    def create 
        if auth_hash = request.env["omniauth.auth"]
           oauth_email = request.env["omniauth.auth"]["info"]["email"] #github pattern
            if user = User.find_by(:email => oauth_email)
                session[:user_id] = user.id
                redirect_to user_deals_path(user.id)
            else
                redirect_to new_user_path 
            end
        else 
            user = User.find_by(:email => params[:user][:email])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to user_deals_path(user.id)
            else
                redirect_to login_path
            end 
        end 
    end

    def destroy
        reset_session
        redirect_to login_path   
    end

    private 

    def auth
        request.env['omniauth.auth']
    end 

end
