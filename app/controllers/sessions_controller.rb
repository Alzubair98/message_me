class SessionsController < ApplicationController 
    before_action :logged_in_redirect, only: [:new, :create]
    
    def new 

    end

    def create 
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "you have successfully logged in"
            redirect_to root_path
        else
            flash[:error] = "Wrong username/email or password"
            redirect_to '/login'
        end
    end

    def destroy 
        reset_session
        flash[:success] = "You have successfully logged out"
        redirect_to login_path
    end

    private 

    def logged_in_redirect 
        if logged_in?
            flash[:error] = "You are already logged in"
            redirect_to root_path
        end
    end
end