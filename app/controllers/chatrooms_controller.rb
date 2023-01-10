class ChatroomsController < ApplicationController 
    before_action :require_user

    def index 
        @room = Room.new
        @message = Message.new
        # @messages = Message.all loading all messages might be error prone 
        @messages = Message.custom_display

        @rooms = Room.public_rooms
        @users = User.all_except(current_user)
    end

    def new 

    end

    def create 

    end
end