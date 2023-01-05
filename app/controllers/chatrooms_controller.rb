class ChatroomsController < ApplicationController 
    before_action :require_user

    def index 
        @message = Message.new
        # @messages = Message.all loading all messages might be error prone 
        @messages = Message.custom_display
    end

    def new 

    end

    def create 

    end
end