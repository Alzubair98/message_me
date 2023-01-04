class SessionsController < ApplicationController 
    def new 

    end

    def create 
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "you have successfully logged in"
            redirect_to root_path
        else
            flash.now[:error] = "Wrong username/email or password"
            render 'new'
        end
    end

    def destroy 
        reset_session
        flash[:success] = "You have successfully logged out"
        redirect_to login_path
    end
end