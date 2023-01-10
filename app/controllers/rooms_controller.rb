class RoomsController < ApplicationController
    before_action :require_user

    def index
        @rooms = Room.public_rooms
        @users = User.all_except(current_user)
    end

    def new 
    end

    def create 
        @room = Room.new(room_params)
        @room.save
        if !@room.save 
            flash[:error] = "Something is wrong"
            redirect_to root_path
        end
    end

    private 

    def room_params 
        params.require(:room).permit(:name)
    end
end