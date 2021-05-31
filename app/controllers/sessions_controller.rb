class SessionsController < ApplicationController

    def new
    end

    def create 
        if auth_hash = request.env["omniauth.auth"]
            #logged in via OAuth
            if request.env["omniauth.auth"]["provider"] == "facebook"
                oauth_email = request.env["omniauth.auth"]["extra"]["raw_info"]["email"]
            else
                oauth_email = request.env["omniauth.auth"]["info"]["email"] #github pattern
            end  
            if user = User.find_by(:email => oauth_email)
                session[:user_id] = user.id
                redirect_to deals_path
            else
                redirect_to new_user_path 
            end
        else 
            user = User.find_by(:email => params[:email])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to deals_path
            else 
                redirect_to login_path
            end 
        end 
    end

    def createfb 
        @user = User.find_or_create_by(email: auth['info']['email']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
        end 
        session[:user_id] = @user.id
        redirect_to deals_path
    end 

    def creategh 
        @user = User.find_or_create_by(email: auth['info']['email']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
        end 
        session[:user_id] = @user.id
        redirect_to deals_path
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
