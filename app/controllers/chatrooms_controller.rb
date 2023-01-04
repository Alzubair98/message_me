class ChatroomsController < ApplicationController 
    before_action :require_user

    def index 
        @message = Message.new
        @messages = Message.all
    end

    def new 

    end

    def create 

    end
end